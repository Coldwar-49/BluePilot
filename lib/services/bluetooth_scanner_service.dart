import 'dart:io';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/device.dart';
import '../core/utils/logger.dart';

class BluetoothScannerService {
  // ── BLE ─────────────────────────────────────────────────────

  Stream<Device> scanBle({
    Duration timeout = const Duration(seconds: 15),
  }) async* {
    try {
      final supported = await FlutterBluePlus.isSupported;
      if (!supported) {
        Logger.warn('BTScanner', 'BLE not supported on this device');
        return;
      }

      await FlutterBluePlus.startScan(timeout: timeout);

      await for (final results in FlutterBluePlus.onScanResults) {
        for (final r in results) {
          yield Device(
            id: r.device.remoteId.str,
            displayName: r.advertisementData.advName.isNotEmpty
                ? r.advertisementData.advName
                : r.device.remoteId.str,
            type: DeviceType.ble,
            source: DiscoverySource.ble,
            macAddress: r.device.remoteId.str,
            rssi: r.rssi,
            status: DeviceConnectionStatus.offline,
            lastSeen: DateTime.now(),
          );
        }
      }
    } catch (e) {
      Logger.error('BTScanner.scanBle', e);
    }
  }

  Future<void> stopBleScan() async {
    try {
      await FlutterBluePlus.stopScan();
    } catch (e) {
      Logger.error('BTScanner.stopBleScan', e);
    }
  }

  // ── Classic BT (Android only) ────────────────────────────────

  /// Returns empty stream on non-Android platforms.
  Stream<Device> scanClassicBt() async* {
    if (!Platform.isAndroid) return;
    // Classic BT discovery via flutter_bluetooth_serial would go here.
    // Excluded from this build to avoid Windows compile issues.
    Logger.info('BTScanner', 'Classic BT scan not enabled in this build');
  }
}
