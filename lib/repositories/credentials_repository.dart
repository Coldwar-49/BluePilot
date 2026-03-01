import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/ssh_credentials.dart';
import '../models/wol_config.dart';

class CredentialsRepository {
  static const _sshPrefix = 'ssh_creds_';
  static const _wolPrefix = 'wol_config_';

  Future<SshCredentials?> loadSsh(String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('$_sshPrefix$deviceId');
    if (raw == null) return null;
    return SshCredentials.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveSsh(SshCredentials creds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$_sshPrefix${creds.deviceId}',
      jsonEncode(creds.toJson()),
    );
  }

  Future<WolConfig?> loadWol(String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString('$_wolPrefix$deviceId');
    if (raw == null) return null;
    return WolConfig.fromJson(jsonDecode(raw) as Map<String, dynamic>);
  }

  Future<void> saveWol(WolConfig config) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      '$_wolPrefix${config.deviceId}',
      jsonEncode(config.toJson()),
    );
  }
}
