import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ssh_service.dart';
import '../models/ssh_credentials.dart';

class SshNotifier extends StateNotifier<AsyncValue<bool>> {
  SshNotifier() : super(const AsyncData(false));

  SshService? _service;

  Future<void> connect(SshCredentials creds) async {
    state = const AsyncLoading();
    _service = SshService();
    final ok = await _service!.connect(creds);
    state = AsyncData(ok);
  }

  Future<SshCommandResult?> runCommand(String cmd) => _service?.run(cmd) ??
      Future.value(const SshCommandResult(
          exitCode: -1, stdout: '', stderr: 'Not connected'));

  Future<void> shutdown({bool isWindows = false}) async {
    await _service?.shutdown(isWindows: isWindows);
  }

  Future<void> restart({bool isWindows = false}) async {
    await _service?.restart(isWindows: isWindows);
  }

  @override
  void dispose() {
    _service?.disconnect();
    super.dispose();
  }
}

final sshProvider =
    StateNotifierProvider.autoDispose<SshNotifier, AsyncValue<bool>>(
  (_) => SshNotifier(),
);
