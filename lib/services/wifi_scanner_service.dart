import 'package:network_info_plus/network_info_plus.dart';
import 'package:network_tools/network_tools.dart';
import '../models/device.dart';
import '../core/utils/logger.dart';

class WifiScannerService {
  final _networkInfo = NetworkInfo();

  Future<String?> _getSubnet() async {
    try {
      final ip = await _networkInfo.getWifiIP();
      if (ip == null) return null;
      final parts = ip.split('.');
      if (parts.length != 4) return null;
      return '${parts[0]}.${parts[1]}.${parts[2]}';
    } catch (e) {
      Logger.error('WifiScannerService', e);
      return null;
    }
  }

  Stream<Device> scan() async* {
    final subnet = await _getSubnet();
    if (subnet == null) {
      Logger.warn('WifiScannerService', 'Could not determine subnet');
      return;
    }

    Logger.info('WifiScannerService', 'Scanning subnet $subnet.0/24');

    await for (final host
        in HostScannerService.instance.getAllPingableDevices(subnet)) {
      final ip = host.address;
      final resolvedHostName = await host.hostName;
      final name = resolvedHostName ??
          (host.weirdHostName.isNotEmpty ? host.weirdHostName : ip);

      yield Device(
        id: ip,
        displayName: name,
        type: DeviceType.unknownLan,
        source: DiscoverySource.wifi,
        ipAddress: ip,
        status: DeviceConnectionStatus.online,
        lastSeen: DateTime.now(),
      );
    }
  }
}
