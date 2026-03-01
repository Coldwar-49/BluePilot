import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/device.dart';
import '../services/wifi_scanner_service.dart';

final wifiScannerServiceProvider = Provider<WifiScannerService>(
  (_) => WifiScannerService(),
);

class WifiScanNotifier extends StateNotifier<List<Device>> {
  WifiScanNotifier(this._service) : super([]);

  final WifiScannerService _service;
  bool _scanning = false;

  bool get isScanning => _scanning;

  Future<void> startScan() async {
    _scanning = true;
    state = [];
    await for (final device in _service.scan()) {
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
}

final wifiScanProvider =
    StateNotifierProvider<WifiScanNotifier, List<Device>>((ref) {
  final service = ref.watch(wifiScannerServiceProvider);
  return WifiScanNotifier(service);
});
