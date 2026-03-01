import 'package:freezed_annotation/freezed_annotation.dart';

part 'ssh_credentials.freezed.dart';
part 'ssh_credentials.g.dart';

@freezed
class SshCredentials with _$SshCredentials {
  const factory SshCredentials({
    required String deviceId,
    required String host,
    @Default(22) int port,
    required String username,
    String? password,
    String? privateKeyPem,
  }) = _SshCredentials;

  factory SshCredentials.fromJson(Map<String, dynamic> json) =>
      _$SshCredentialsFromJson(json);
}
