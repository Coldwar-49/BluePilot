// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
  id: json['id'] as String,
  displayName: json['displayName'] as String,
  type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
  source: $enumDecode(_$DiscoverySourceEnumMap, json['source']),
  status:
      $enumDecodeNullable(_$DeviceConnectionStatusEnumMap, json['status']) ??
      DeviceConnectionStatus.offline,
  ipAddress: json['ipAddress'] as String?,
  macAddress: json['macAddress'] as String?,
  rssi: (json['rssi'] as num?)?.toInt(),
  manufacturer: json['manufacturer'] as String?,
  modelNumber: json['modelNumber'] as String?,
  isSaved: json['isSaved'] as bool? ?? false,
  lastSeen: json['lastSeen'] == null
      ? null
      : DateTime.parse(json['lastSeen'] as String),
);

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'source': _$DiscoverySourceEnumMap[instance.source]!,
      'status': _$DeviceConnectionStatusEnumMap[instance.status]!,
      'ipAddress': instance.ipAddress,
      'macAddress': instance.macAddress,
      'rssi': instance.rssi,
      'manufacturer': instance.manufacturer,
      'modelNumber': instance.modelNumber,
      'isSaved': instance.isSaved,
      'lastSeen': instance.lastSeen?.toIso8601String(),
    };

const _$DeviceTypeEnumMap = {
  DeviceType.pc: 'pc',
  DeviceType.mobile: 'mobile',
  DeviceType.iot: 'iot',
  DeviceType.unknownLan: 'unknownLan',
  DeviceType.ble: 'ble',
  DeviceType.classicBt: 'classicBt',
};

const _$DiscoverySourceEnumMap = {
  DiscoverySource.wifi: 'wifi',
  DiscoverySource.ble: 'ble',
  DiscoverySource.classicBt: 'classicBt',
};

const _$DeviceConnectionStatusEnumMap = {
  DeviceConnectionStatus.online: 'online',
  DeviceConnectionStatus.offline: 'offline',
  DeviceConnectionStatus.connecting: 'connecting',
};
