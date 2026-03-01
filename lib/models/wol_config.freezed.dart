// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wol_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

WolConfig _$WolConfigFromJson(Map<String, dynamic> json) {
  return _WolConfig.fromJson(json);
}

/// @nodoc
mixin _$WolConfig {
  String get deviceId => throw _privateConstructorUsedError;
  String get macAddress =>
      throw _privateConstructorUsedError; // "AA:BB:CC:DD:EE:FF"
  String get broadcastIp =>
      throw _privateConstructorUsedError; // "192.168.1.255"
  int get port => throw _privateConstructorUsedError;

  /// Serializes this WolConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WolConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WolConfigCopyWith<WolConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WolConfigCopyWith<$Res> {
  factory $WolConfigCopyWith(WolConfig value, $Res Function(WolConfig) then) =
      _$WolConfigCopyWithImpl<$Res, WolConfig>;
  @useResult
  $Res call({String deviceId, String macAddress, String broadcastIp, int port});
}

/// @nodoc
class _$WolConfigCopyWithImpl<$Res, $Val extends WolConfig>
    implements $WolConfigCopyWith<$Res> {
  _$WolConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WolConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? macAddress = null,
    Object? broadcastIp = null,
    Object? port = null,
  }) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            macAddress: null == macAddress
                ? _value.macAddress
                : macAddress // ignore: cast_nullable_to_non_nullable
                      as String,
            broadcastIp: null == broadcastIp
                ? _value.broadcastIp
                : broadcastIp // ignore: cast_nullable_to_non_nullable
                      as String,
            port: null == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$WolConfigImplCopyWith<$Res>
    implements $WolConfigCopyWith<$Res> {
  factory _$$WolConfigImplCopyWith(
    _$WolConfigImpl value,
    $Res Function(_$WolConfigImpl) then,
  ) = __$$WolConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String deviceId, String macAddress, String broadcastIp, int port});
}

/// @nodoc
class __$$WolConfigImplCopyWithImpl<$Res>
    extends _$WolConfigCopyWithImpl<$Res, _$WolConfigImpl>
    implements _$$WolConfigImplCopyWith<$Res> {
  __$$WolConfigImplCopyWithImpl(
    _$WolConfigImpl _value,
    $Res Function(_$WolConfigImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of WolConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? macAddress = null,
    Object? broadcastIp = null,
    Object? port = null,
  }) {
    return _then(
      _$WolConfigImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        macAddress: null == macAddress
            ? _value.macAddress
            : macAddress // ignore: cast_nullable_to_non_nullable
                  as String,
        broadcastIp: null == broadcastIp
            ? _value.broadcastIp
            : broadcastIp // ignore: cast_nullable_to_non_nullable
                  as String,
        port: null == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$WolConfigImpl implements _WolConfig {
  const _$WolConfigImpl({
    required this.deviceId,
    required this.macAddress,
    required this.broadcastIp,
    this.port = 9,
  });

  factory _$WolConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$WolConfigImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String macAddress;
  // "AA:BB:CC:DD:EE:FF"
  @override
  final String broadcastIp;
  // "192.168.1.255"
  @override
  @JsonKey()
  final int port;

  @override
  String toString() {
    return 'WolConfig(deviceId: $deviceId, macAddress: $macAddress, broadcastIp: $broadcastIp, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WolConfigImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress) &&
            (identical(other.broadcastIp, broadcastIp) ||
                other.broadcastIp == broadcastIp) &&
            (identical(other.port, port) || other.port == port));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, deviceId, macAddress, broadcastIp, port);

  /// Create a copy of WolConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WolConfigImplCopyWith<_$WolConfigImpl> get copyWith =>
      __$$WolConfigImplCopyWithImpl<_$WolConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WolConfigImplToJson(this);
  }
}

abstract class _WolConfig implements WolConfig {
  const factory _WolConfig({
    required final String deviceId,
    required final String macAddress,
    required final String broadcastIp,
    final int port,
  }) = _$WolConfigImpl;

  factory _WolConfig.fromJson(Map<String, dynamic> json) =
      _$WolConfigImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get macAddress; // "AA:BB:CC:DD:EE:FF"
  @override
  String get broadcastIp; // "192.168.1.255"
  @override
  int get port;

  /// Create a copy of WolConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WolConfigImplCopyWith<_$WolConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
