import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:network_tools/network_tools.dart';
import '../models/device.dart';
import '../core/utils/logger.dart';

class WifiScannerService {
  final _networkInfo = NetworkInfo();

  /// Attempts to resolve the local subnet (e.g. "192.168.1").
  /// Tries WiFi first, then falls back to any active IPv4 interface
  /// (covers Ethernet, VPN, etc.).
  Future<String?> _getSubnet() async {
    // 1. Try WiFi IP (works when connected via WiFi)
    try {
      final ip = await _networkInfo.getWifiIP();
      final subnet = _subnetFromIp(ip);
      if (subnet != null) return subnet;
    } catch (_) {}

    // 2. Fallback: enumerate all IPv4 interfaces (Ethernet, VPN, …)
    try {
      final interfaces = await NetworkInterface.list(
        includeLoopback: false,
        type: InternetAddressType.IPv4,
      );
      for (final iface in interfaces) {
        for (final addr in iface.addresses) {
          final ip = addr.address;
          // Skip link-local and loopback
          if (ip.startsWith('169.254') || ip.startsWith('127.')) continue;
          final subnet = _subnetFromIp(ip);
          if (subnet != null) {
            Logger.info('WifiScannerService',
                'Using interface "${iface.name}" ($ip)');
            return subnet;
          }
        }
      }
    } catch (e) {
      Logger.error('WifiScannerService._getSubnet', e);
    }

    return null;
  }

  String? _subnetFromIp(String? ip) {
    if (ip == null) return null;
    final parts = ip.split('.');
    if (parts.length != 4) return null;
    return '${parts[0]}.${parts[1]}.${parts[2]}';
  }

  Stream<Device> scan() async* {
    final subnet = await _getSubnet();
    if (subnet == null) {
      Logger.warn('WifiScannerService',
          'Impossible de détecter le sous-réseau local');
      return;
    }

    Logger.info('WifiScannerService', 'Scan subnet $subnet.0/24');

    try {
      await for (final host
          in HostScannerService.instance.getAllPingableDevices(subnet)) {
        try {
          final ip = host.address;

          // host.hostName is Future<String?> and may throw FormatException
          // on French Windows (CP1252 hostnames decoded as UTF-8).
          String name;
          try {
            name = await host.hostName ??
                (host.weirdHostName.isNotEmpty ? host.weirdHostName : ip);
          } on FormatException {
            name = host.weirdHostName.isNotEmpty ? host.weirdHostName : ip;
          }

          yield Device(
            id: ip,
            displayName: name,
            type: DeviceType.unknownLan,
            source: DiscoverySource.wifi,
            ipAddress: ip,
            status: DeviceConnectionStatus.online,
            lastSeen: DateTime.now(),
          );
        } catch (e) {
          // Skip this host rather than aborting the whole scan
          Logger.warn('WifiScannerService', 'Skip host: $e');
        }
      }
    } on FormatException catch (e) {
      Logger.error('WifiScannerService.scan',
          'Erreur encodage (Windows code page?) : $e');
    } catch (e) {
      Logger.error('WifiScannerService.scan', e);
    }
  }
}
