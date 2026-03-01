import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/device.dart';
import '../services/bluetooth_scanner_service.dart';

final bluetoothScannerServiceProvider = Provider<BluetoothScannerService>(
  (_) => BluetoothScannerService(),
);

class BluetoothScanNotifier extends StateNotifier<List<Device>> {
  BluetoothScanNotifier(this._service) : super([]);

  final BluetoothScannerService _service;
  bool _scanning = false;

  bool get isScanning => _scanning;

  Future<void> startScan() async {
    _scanning = true;
    state = [];

    await for (final device in _service.scanBle()) {
      final idx = state.indexWhere((d) => d.id == device.id);
      if (idx >= 0) {
        final updated = List<Device>.from(state);
        updated[idx] = device;
        state = updated;
      } else {
        state = [...state, device];
      }
    }
    _scanning = false;
  }

  Future<void> stopScan() async {
    await _service.stopBleScan();
    _scanning = false;
  }
}

final bluetoothScanProvider =
    StateNotifierProvider<BluetoothScanNotifier, List<Device>>((ref) {
  final service = ref.watch(bluetoothScannerServiceProvider);
  return BluetoothScanNotifier(service);
});
