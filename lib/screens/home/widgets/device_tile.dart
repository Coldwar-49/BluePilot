import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../models/device.dart';

class DeviceTile extends StatelessWidget {
  final Device device;
  const DeviceTile({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: _sourceColor(device.source),
        child: Icon(_typeIcon(device.type), color: Colors.white, size: 20),
      ),
      title: Text(device.displayName),
      subtitle: Text(_subtitle(device)),
      trailing: device.rssi != null
          ? Text('${device.rssi} dBm',
              style: Theme.of(context).textTheme.bodySmall)
          : null,
      onTap: () => context.push('/device', extra: device),
    );
  }

  String _subtitle(Device d) {
    final parts = <String>[];
    if (d.ipAddress != null) parts.add(d.ipAddress!);
    if (d.macAddress != null) parts.add(d.macAddress!);
    if (d.source == DiscoverySource.ble) parts.add('BLE');
    if (d.source == DiscoverySource.classicBt) parts.add('Bluetooth Classic');
    return parts.join(' · ');
  }

  Color _sourceColor(DiscoverySource src) {
    return switch (src) {
      DiscoverySource.wifi => Colors.teal,
      DiscoverySource.ble => Colors.blue,
      DiscoverySource.classicBt => Colors.indigo,
    };
  }

  IconData _typeIcon(DeviceType type) {
    return switch (type) {
      DeviceType.pc => Icons.computer,
      DeviceType.mobile => Icons.smartphone,
      DeviceType.iot => Icons.device_hub,
      DeviceType.ble => Icons.bluetooth,
      DeviceType.classicBt => Icons.bluetooth_connected,
      DeviceType.unknownLan => Icons.device_unknown,
    };
  }
}
