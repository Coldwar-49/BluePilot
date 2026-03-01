// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  String get id => throw _privateConstructorUsedError; // IP for LAN, MAC for BT
  String get displayName => throw _privateConstructorUsedError;
  DeviceType get type => throw _privateConstructorUsedError;
  DiscoverySource get source => throw _privateConstructorUsedError;
  DeviceConnectionStatus get status => throw _privateConstructorUsedError;
  String? get ipAddress => throw _privateConstructorUsedError;
  String? get macAddress => throw _privateConstructorUsedError;
  int? get rssi => throw _privateConstructorUsedError; // signal strength (BT)
  String? get manufacturer => throw _privateConstructorUsedError;
  String? get modelNumber => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;
  DateTime? get lastSeen => throw _privateConstructorUsedError;

  /// Serializes this Device to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call({
    String id,
    String displayName,
    DeviceType type,
    DiscoverySource source,
    DeviceConnectionStatus status,
    String? ipAddress,
    String? macAddress,
    int? rssi,
    String? manufacturer,
    String? modelNumber,
    bool isSaved,
    DateTime? lastSeen,
  });
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? type = null,
    Object? source = null,
    Object? status = null,
    Object? ipAddress = freezed,
    Object? macAddress = freezed,
    Object? rssi = freezed,
    Object? manufacturer = freezed,
    Object? modelNumber = freezed,
    Object? isSaved = null,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            displayName: null == displayName
                ? _value.displayName
                : displayName // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as DeviceType,
            source: null == source
                ? _value.source
                : source // ignore: cast_nullable_to_non_nullable
                      as DiscoverySource,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as DeviceConnectionStatus,
            ipAddress: freezed == ipAddress
                ? _value.ipAddress
                : ipAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            macAddress: freezed == macAddress
                ? _value.macAddress
                : macAddress // ignore: cast_nullable_to_non_nullable
                      as String?,
            rssi: freezed == rssi
                ? _value.rssi
                : rssi // ignore: cast_nullable_to_non_nullable
                      as int?,
            manufacturer: freezed == manufacturer
                ? _value.manufacturer
                : manufacturer // ignore: cast_nullable_to_non_nullable
                      as String?,
            modelNumber: freezed == modelNumber
                ? _value.modelNumber
                : modelNumber // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSaved: null == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool,
            lastSeen: freezed == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
    _$DeviceImpl value,
    $Res Function(_$DeviceImpl) then,
  ) = __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String displayName,
    DeviceType type,
    DiscoverySource source,
    DeviceConnectionStatus status,
    String? ipAddress,
    String? macAddress,
    int? rssi,
    String? manufacturer,
    String? modelNumber,
    bool isSaved,
    DateTime? lastSeen,
  });
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
    _$DeviceImpl _value,
    $Res Function(_$DeviceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? displayName = null,
    Object? type = null,
    Object? source = null,
    Object? status = null,
    Object? ipAddress = freezed,
    Object? macAddress = freezed,
    Object? rssi = freezed,
    Object? manufacturer = freezed,
    Object? modelNumber = freezed,
    Object? isSaved = null,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _$DeviceImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        displayName: null == displayName
            ? _value.displayName
            : displayName // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as DeviceType,
        source: null == source
            ? _value.source
            : source // ignore: cast_nullable_to_non_nullable
                  as DiscoverySource,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as DeviceConnectionStatus,
        ipAddress: freezed == ipAddress
            ? _value.ipAddress
            : ipAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        macAddress: freezed == macAddress
            ? _value.macAddress
            : macAddress // ignore: cast_nullable_to_non_nullable
                  as String?,
        rssi: freezed == rssi
            ? _value.rssi
            : rssi // ignore: cast_nullable_to_non_nullable
                  as int?,
        manufacturer: freezed == manufacturer
            ? _value.manufacturer
            : manufacturer // ignore: cast_nullable_to_non_nullable
                  as String?,
        modelNumber: freezed == modelNumber
            ? _value.modelNumber
            : modelNumber // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSaved: null == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl implements _Device {
  const _$DeviceImpl({
    required this.id,
    required this.displayName,
    required this.type,
    required this.source,
    this.status = DeviceConnectionStatus.offline,
    this.ipAddress,
    this.macAddress,
    this.rssi,
    this.manufacturer,
    this.modelNumber,
    this.isSaved = false,
    this.lastSeen,
  });

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  @override
  final String id;
  // IP for LAN, MAC for BT
  @override
  final String displayName;
  @override
  final DeviceType type;
  @override
  final DiscoverySource source;
  @override
  @JsonKey()
  final DeviceConnectionStatus status;
  @override
  final String? ipAddress;
  @override
  final String? macAddress;
  @override
  final int? rssi;
  // signal strength (BT)
  @override
  final String? manufacturer;
  @override
  final String? modelNumber;
  @override
  @JsonKey()
  final bool isSaved;
  @override
  final DateTime? lastSeen;

  @override
  String toString() {
    return 'Device(id: $id, displayName: $displayName, type: $type, source: $source, status: $status, ipAddress: $ipAddress, macAddress: $macAddress, rssi: $rssi, manufacturer: $manufacturer, modelNumber: $modelNumber, isSaved: $isSaved, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.rssi, rssi) || other.rssi == rssi) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.modelNumber, modelNumber) ||
                other.modelNumber == modelNumber) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    displayName,
    type,
    source,
    status,
    ipAddress,
    macAddress,
    rssi,
    manufacturer,
    modelNumber,
    isSaved,
    lastSeen,
  );

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(this);
  }
}

abstract class _Device implements Device {
  const factory _Device({
    required final String id,
    required final String displayName,
    required final DeviceType type,
    required final DiscoverySource source,
    final DeviceConnectionStatus status,
    final String? ipAddress,
    final String? macAddress,
    final int? rssi,
    final String? manufacturer,
    final String? modelNumber,
    final bool isSaved,
    final DateTime? lastSeen,
  }) = _$DeviceImpl;

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override
  String get id; // IP for LAN, MAC for BT
  @override
  String get displayName;
  @override
  DeviceType get type;
  @override
  DiscoverySource get source;
  @override
  DeviceConnectionStatus get status;
  @override
  String? get ipAddress;
  @override
  String? get macAddress;
  @override
  int? get rssi; // signal strength (BT)
  @override
  String? get manufacturer;
  @override
  String? get modelNumber;
  @override
  bool get isSaved;
  @override
  DateTime? get lastSeen;

  /// Create a copy of Device
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
