import 'dart:async';
import 'dart:io';
import '../models/device.dart';
import '../core/utils/logger.dart';

/// Scans the local /24 subnet using ICMP ping (dart:io Process) and TCP
/// fallback. Does NOT use network_tools to avoid Windows CP1252 encoding
/// issues with system command output parsing.
class WifiScannerService {
  // ── Subnet detection ──────────────────────────────────────────────

  Future<String?> _getSubnet() async {
    try {
      final interfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.IPv4,
      );
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          final ip = addr.address;
          // Skip link-local (169.254.x.x) and loopback
          if (ip.startsWith('169.254') || ip.startsWith('127.')) continue;
          final subnet = _subnetOf(ip);
          if (subnet != null) {
            Logger.info('WifiScannerService',
                'Interface "${iface.name}" → $ip (subnet $subnet.0/24)');
            return subnet;
          }
        }
      }
    } catch (e) {
      Logger.error('WifiScannerService._getSubnet', e);
    }
    return null;
  }

  String? _subnetOf(String ip) {
    final parts = ip.split('.');
    return parts.length == 4 ? '${parts[0]}.${parts[1]}.${parts[2]}' : null;
  }

  // ── Main scan stream ──────────────────────────────────────────────

  Stream<Device> scan() async* {
    final subnet = await _getSubnet();
    if (subnet == null) {
      Logger.warn('WifiScannerService', 'Impossible de détecter le sous-réseau');
      return;
    }

    Logger.info('WifiScannerService', 'Scan $subnet.0/24 ...');

    final controller = StreamController<Device>();

    // Scan all 254 hosts in batches to avoid flooding the network
    Future<void> doScan() async {
      const batchSize = 25;
      for (var start = 1; start <= 254; start += batchSize) {
        final end = (start + batchSize - 1).clamp(1, 254);
        await Future.wait([
          for (var i = start; i <= end; i++)
            _probeHost('$subnet.$i', controller),
        ]);
      }
    }

    unawaited(
      doScan()
          .catchError((Object e) => Logger.error('WifiScannerService.scan', e))
          .whenComplete(() {
        if (!controller.isClosed) controller.close();
      }),
    );

    yield* controller.stream;
  }

  // ── Host probing ──────────────────────────────────────────────────

  Future<void> _probeHost(String ip, StreamController<Device> sink) async {
    if (sink.isClosed) return;
    if (!await _isAlive(ip)) return;
    if (sink.isClosed) return;

    final name = await _resolveHostname(ip);
    if (!sink.isClosed) {
      sink.add(Device(
        id: ip,
        displayName: name,
        type: DeviceType.unknownLan,
        source: DiscoverySource.wifi,
        ipAddress: ip,
        status: DeviceConnectionStatus.online,
        lastSeen: DateTime.now(),
      ));
    }
  }

  /// Returns true if the host responds to ping or any common TCP port.
  Future<bool> _isAlive(String ip) async {
    // ── ICMP ping via system Process ──────────────────────────────
    // Use SystemEncoding so the OS-native code page (CP850/CP1252 on
    // French Windows) is used to decode stdout. We only check exitCode
    // so the actual text content doesn't matter.
    try {
      final args = Platform.isWindows
          ? ['-n', '1', '-w', '500', ip]
          : ['-c', '1', '-W', '1', ip];

      final result = await Process.run(
        'ping',
        args,
        stdoutEncoding: const SystemEncoding(),
        stderrEncoding: const SystemEncoding(),
      ).timeout(const Duration(seconds: 2));

      if (result.exitCode == 0) return true;
    } catch (_) {}

    // ── TCP fallback (for hosts that block ICMP) ──────────────────
    return _tcpAlive(ip);
  }

  Future<bool> _tcpAlive(String ip) async {
    const ports = [80, 443, 22, 445, 8080, 3389];
    for (final port in ports) {
      try {
        final socket = await Socket.connect(
          ip,
          port,
          timeout: const Duration(milliseconds: 300),
        );
        socket.destroy();
        return true;
      } catch (_) {}
    }
    return false;
  }

  /// Reverse-DNS lookup using the OS resolver (no manual byte decoding).
  Future<String> _resolveHostname(String ip) async {
    try {
      final addr = (await InternetAddress.lookup(ip)).firstOrNull;
      if (addr != null && addr.host.isNotEmpty && addr.host != ip) {
        return addr.host;
      }
      // Attempt reverse lookup
      final reversed =
          await InternetAddress(ip).reverse().timeout(const Duration(seconds: 1));
      if (reversed.host.isNotEmpty) return reversed.host;
    } catch (_) {}
    return ip;
  }
}
