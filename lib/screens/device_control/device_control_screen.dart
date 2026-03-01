import 'package:flutter/material.dart';
import '../../models/device.dart';
import 'widgets/pc_control_panel.dart';
import 'widgets/ble_control_panel.dart';

class DeviceControlScreen extends StatelessWidget {
  final Device device;
  const DeviceControlScreen({super.key, required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.displayName),
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
      ),
      body: _buildPanel(),
    );
  }

  Widget _buildPanel() {
    return switch (device.source) {
      DiscoverySource.wifi => PcControlPanel(device: device),
      DiscoverySource.ble => BleControlPanel(device: device),
      DiscoverySource.classicBt => BleControlPanel(device: device),
    };
  }
}
