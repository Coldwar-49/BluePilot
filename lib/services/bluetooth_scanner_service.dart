import 'dart:io';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../models/device.dart';
import '../core/utils/logger.dart';

class BluetoothScannerService {
  /// flutter_blue_plus ne supporte pas Windows (pas de pilote BLE natif).
  /// Sur Linux, bluez est requis. On vérifie avant tout appel API.
  static bool get _bleSupported =>
      Platform.isAndroid || Platform.isIOS || Platform.isMacOS || Platform.isLinux;

  // ── BLE ─────────────────────────────────────────────────────

  Stream<Device> scanBle({
    Duration timeout = const Duration(seconds: 15),
  }) async* {
    if (!_bleSupported) {
      Logger.info('BTScanner', 'BLE non supporté sur ${Platform.operatingSystem}');
      return;
    }

    try {
      final supported = await FlutterBluePlus.isSupported;
      if (!supported) {
        Logger.info('BTScanner', 'BLE non disponible sur cet appareil');
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
    if (!_bleSupported) return;
    try {
      await FlutterBluePlus.stopScan();
    } catch (e) {
      Logger.error('BTScanner.stopBleScan', e);
    }
  }

  // ── Classic BT (Android only) ────────────────────────────────

  Stream<Device> scanClassicBt() async* {
    if (!Platform.isAndroid) return;
    Logger.info('BTScanner', 'Classic BT scan non activé dans ce build');
  }
}
