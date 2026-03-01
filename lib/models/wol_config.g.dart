// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wol_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WolConfigImpl _$$WolConfigImplFromJson(Map<String, dynamic> json) =>
    _$WolConfigImpl(
      deviceId: json['deviceId'] as String,
      macAddress: json['macAddress'] as String,
      broadcastIp: json['broadcastIp'] as String,
      port: (json['port'] as num?)?.toInt() ?? 9,
    );

Map<String, dynamic> _$$WolConfigImplToJson(_$WolConfigImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'macAddress': instance.macAddress,
      'broadcastIp': instance.broadcastIp,
      'port': instance.port,
    };
