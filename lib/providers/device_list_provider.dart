import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/device.dart';
import 'wifi_scan_provider.dart';
import 'bluetooth_scan_provider.dart';

final allDevicesProvider = Provider<List<Device>>((ref) {
  final wifi = ref.watch(wifiScanProvider);
  final bt = ref.watch(bluetoothScanProvider);
  final all = [...wifi, ...bt];
  all.sort((a, b) => a.displayName.compareTo(b.displayName));
  return all;
});
