import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/wifi_scan_provider.dart';
import '../../../providers/bluetooth_scan_provider.dart';

class ScanFab extends ConsumerWidget {
  const ScanFab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wifiNotifier = ref.read(wifiScanProvider.notifier);
    final btNotifier = ref.read(bluetoothScanProvider.notifier);

    return FloatingActionButton.extended(
      icon: const Icon(Icons.radar),
      label: const Text('Scanner'),
      onPressed: () {
        wifiNotifier.startScan();
        btNotifier.startScan();
      },
    );
  }
}
