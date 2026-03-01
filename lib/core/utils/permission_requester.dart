import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

Future<void> requestAllPermissions() async {
  if (Platform.isAndroid) {
    await [
      Permission.location,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.nearbyWifiDevices,
    ].request();
  }
}
