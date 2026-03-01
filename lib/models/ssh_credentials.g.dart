// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SshCredentialsImpl _$$SshCredentialsImplFromJson(Map<String, dynamic> json) =>
    _$SshCredentialsImpl(
      deviceId: json['deviceId'] as String,
      host: json['host'] as String,
      port: (json['port'] as num?)?.toInt() ?? 22,
      username: json['username'] as String,
      password: json['password'] as String?,
      privateKeyPem: json['privateKeyPem'] as String?,
    );

Map<String, dynamic> _$$SshCredentialsImplToJson(
  _$SshCredentialsImpl instance,
) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'host': instance.host,
  'port': instance.port,
  'username': instance.username,
  'password': instance.password,
  'privateKeyPem': instance.privateKeyPem,
};
