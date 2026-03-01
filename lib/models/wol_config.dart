import 'package:freezed_annotation/freezed_annotation.dart';

part 'wol_config.freezed.dart';
part 'wol_config.g.dart';

@freezed
class WolConfig with _$WolConfig {
  const factory WolConfig({
    required String deviceId,
    required String macAddress, // "AA:BB:CC:DD:EE:FF"
    required String broadcastIp, // "192.168.1.255"
    @Default(9) int port,
  }) = _WolConfig;

  factory WolConfig.fromJson(Map<String, dynamic> json) =>
      _$WolConfigFromJson(json);
}
