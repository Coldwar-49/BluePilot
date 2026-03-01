import 'package:freezed_annotation/freezed_annotation.dart';

part 'device.freezed.dart';
part 'device.g.dart';

enum DeviceType { pc, mobile, iot, unknownLan, ble, classicBt }

enum DeviceConnectionStatus { online, offline, connecting }

enum DiscoverySource { wifi, ble, classicBt }

@freezed
class Device with _$Device {
  const factory Device({
    required String id, // IP for LAN, MAC for BT
    required String displayName,
    required DeviceType type,
    required DiscoverySource source,
    @Default(DeviceConnectionStatus.offline) DeviceConnectionStatus status,
    String? ipAddress,
    String? macAddress,
    int? rssi, // signal strength (BT)
    String? manufacturer,
    String? modelNumber,
    @Default(false) bool isSaved,
    DateTime? lastSeen,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
