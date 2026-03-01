// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ssh_credentials.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SshCredentials _$SshCredentialsFromJson(Map<String, dynamic> json) {
  return _SshCredentials.fromJson(json);
}

/// @nodoc
mixin _$SshCredentials {
  String get deviceId => throw _privateConstructorUsedError;
  String get host => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get privateKeyPem => throw _privateConstructorUsedError;

  /// Serializes this SshCredentials to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SshCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SshCredentialsCopyWith<SshCredentials> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SshCredentialsCopyWith<$Res> {
  factory $SshCredentialsCopyWith(
    SshCredentials value,
    $Res Function(SshCredentials) then,
  ) = _$SshCredentialsCopyWithImpl<$Res, SshCredentials>;
  @useResult
  $Res call({
    String deviceId,
    String host,
    int port,
    String username,
    String? password,
    String? privateKeyPem,
  });
}

/// @nodoc
class _$SshCredentialsCopyWithImpl<$Res, $Val extends SshCredentials>
    implements $SshCredentialsCopyWith<$Res> {
  _$SshCredentialsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SshCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKeyPem = freezed,
  }) {
    return _then(
      _value.copyWith(
            deviceId: null == deviceId
                ? _value.deviceId
                : deviceId // ignore: cast_nullable_to_non_nullable
                      as String,
            host: null == host
                ? _value.host
                : host // ignore: cast_nullable_to_non_nullable
                      as String,
            port: null == port
                ? _value.port
                : port // ignore: cast_nullable_to_non_nullable
                      as int,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            password: freezed == password
                ? _value.password
                : password // ignore: cast_nullable_to_non_nullable
                      as String?,
            privateKeyPem: freezed == privateKeyPem
                ? _value.privateKeyPem
                : privateKeyPem // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SshCredentialsImplCopyWith<$Res>
    implements $SshCredentialsCopyWith<$Res> {
  factory _$$SshCredentialsImplCopyWith(
    _$SshCredentialsImpl value,
    $Res Function(_$SshCredentialsImpl) then,
  ) = __$$SshCredentialsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String deviceId,
    String host,
    int port,
    String username,
    String? password,
    String? privateKeyPem,
  });
}

/// @nodoc
class __$$SshCredentialsImplCopyWithImpl<$Res>
    extends _$SshCredentialsCopyWithImpl<$Res, _$SshCredentialsImpl>
    implements _$$SshCredentialsImplCopyWith<$Res> {
  __$$SshCredentialsImplCopyWithImpl(
    _$SshCredentialsImpl _value,
    $Res Function(_$SshCredentialsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SshCredentials
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = null,
    Object? host = null,
    Object? port = null,
    Object? username = null,
    Object? password = freezed,
    Object? privateKeyPem = freezed,
  }) {
    return _then(
      _$SshCredentialsImpl(
        deviceId: null == deviceId
            ? _value.deviceId
            : deviceId // ignore: cast_nullable_to_non_nullable
                  as String,
        host: null == host
            ? _value.host
            : host // ignore: cast_nullable_to_non_nullable
                  as String,
        port: null == port
            ? _value.port
            : port // ignore: cast_nullable_to_non_nullable
                  as int,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        password: freezed == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String?,
        privateKeyPem: freezed == privateKeyPem
            ? _value.privateKeyPem
            : privateKeyPem // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SshCredentialsImpl implements _SshCredentials {
  const _$SshCredentialsImpl({
    required this.deviceId,
    required this.host,
    this.port = 22,
    required this.username,
    this.password,
    this.privateKeyPem,
  });

  factory _$SshCredentialsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SshCredentialsImplFromJson(json);

  @override
  final String deviceId;
  @override
  final String host;
  @override
  @JsonKey()
  final int port;
  @override
  final String username;
  @override
  final String? password;
  @override
  final String? privateKeyPem;

  @override
  String toString() {
    return 'SshCredentials(deviceId: $deviceId, host: $host, port: $port, username: $username, password: $password, privateKeyPem: $privateKeyPem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SshCredentialsImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.privateKeyPem, privateKeyPem) ||
                other.privateKeyPem == privateKeyPem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    deviceId,
    host,
    port,
    username,
    password,
    privateKeyPem,
  );

  /// Create a copy of SshCredentials
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SshCredentialsImplCopyWith<_$SshCredentialsImpl> get copyWith =>
      __$$SshCredentialsImplCopyWithImpl<_$SshCredentialsImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SshCredentialsImplToJson(this);
  }
}

abstract class _SshCredentials implements SshCredentials {
  const factory _SshCredentials({
    required final String deviceId,
    required final String host,
    final int port,
    required final String username,
    final String? password,
    final String? privateKeyPem,
  }) = _$SshCredentialsImpl;

  factory _SshCredentials.fromJson(Map<String, dynamic> json) =
      _$SshCredentialsImpl.fromJson;

  @override
  String get deviceId;
  @override
  String get host;
  @override
  int get port;
  @override
  String get username;
  @override
  String? get password;
  @override
  String? get privateKeyPem;

  /// Create a copy of SshCredentials
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SshCredentialsImplCopyWith<_$SshCredentialsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
