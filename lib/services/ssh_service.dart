import 'package:dartssh2/dartssh2.dart';
import '../models/ssh_credentials.dart';
import '../core/utils/logger.dart';

class SshCommandResult {
  final int exitCode;
  final String stdout;
  final String stderr;

  const SshCommandResult({
    required this.exitCode,
    required this.stdout,
    required this.stderr,
  });

  bool get success => exitCode == 0;
}

class SshService {
  SSHClient? _client;

  bool get isConnected => _client != null;

  Future<bool> connect(SshCredentials creds) async {
    try {
      final socket = await SSHSocket.connect(
        creds.host,
        creds.port,
        timeout: const Duration(seconds: 10),
      );

      _client = SSHClient(
        socket,
        username: creds.username,
        onPasswordRequest: creds.password != null ? () => creds.password! : null,
        identities: creds.privateKeyPem != null
            ? SSHKeyPair.fromPem(creds.privateKeyPem!)
            : null,
      );

      Logger.info('SshService', 'Connected to ${creds.host}');
      return true;
    } catch (e) {
      Logger.error('SshService.connect', e);
      return false;
    }
  }

  Future<SshCommandResult> run(String command) async {
    if (_client == null) {
      return const SshCommandResult(
        exitCode: -1,
        stdout: '',
        stderr: 'Not connected',
      );
    }
    try {
      final output = await _client!.run(command);
      return SshCommandResult(
        exitCode: 0,
        stdout: String.fromCharCodes(output),
        stderr: '',
      );
    } catch (e) {
      Logger.error('SshService.run', e);
      return SshCommandResult(exitCode: -1, stdout: '', stderr: e.toString());
    }
  }

  Future<SshCommandResult> shutdown({bool isWindows = false}) =>
      run(isWindows ? 'shutdown /s /t 0' : 'sudo shutdown -h now');

  Future<SshCommandResult> restart({bool isWindows = false}) =>
      run(isWindows ? 'shutdown /r /t 0' : 'sudo reboot');

  Future<void> disconnect() async {
    _client?.close();
    _client = null;
    Logger.info('SshService', 'Disconnected');
  }
}
