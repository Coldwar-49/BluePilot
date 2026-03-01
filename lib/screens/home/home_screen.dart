import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/utils/permission_requester.dart';
import '../../models/device.dart';
import '../../providers/device_list_provider.dart';
import '../../providers/wifi_scan_provider.dart';
import '../../providers/bluetooth_scan_provider.dart';
import 'widgets/device_tile.dart';
import 'widgets/scan_fab.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    requestAllPermissions();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final all = ref.watch(allDevicesProvider);
    final wifi = ref.watch(wifiScanProvider);
    final bt = ref.watch(bluetoothScanProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BluePilot'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Tous (${all.length})'),
            Tab(text: 'WiFi (${wifi.length})'),
            Tab(text: 'Bluetooth (${bt.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _DeviceList(devices: all),
          _DeviceList(devices: wifi),
          _DeviceList(devices: bt),
        ],
      ),
      floatingActionButton: const ScanFab(),
    );
  }
}

class _DeviceList extends StatelessWidget {
  final List<Device> devices;
  const _DeviceList({required this.devices});

  @override
  Widget build(BuildContext context) {
    if (devices.isEmpty) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.radar, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'Aucun appareil trouvé.\nAppuyez sur Scanner pour démarrer.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: devices.length,
      itemBuilder: (ctx, i) => DeviceTile(device: devices[i]),
    );
  }
}
