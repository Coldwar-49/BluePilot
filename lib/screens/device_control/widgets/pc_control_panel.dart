import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/device.dart';
import '../../../models/ssh_credentials.dart';
import '../../../models/wol_config.dart';
import '../../../providers/ssh_provider.dart';
import '../../../providers/wol_provider.dart';
import '../../../repositories/credentials_repository.dart';

class PcControlPanel extends ConsumerStatefulWidget {
  final Device device;
  const PcControlPanel({super.key, required this.device});

  @override
  ConsumerState<PcControlPanel> createState() => _PcControlPanelState();
}

class _PcControlPanelState extends ConsumerState<PcControlPanel> {
  final _repo = CredentialsRepository();
  SshCredentials? _sshCreds;
  WolConfig? _wolConfig;
  bool _loadingCreds = true;

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  Future<void> _loadCredentials() async {
    final ssh = await _repo.loadSsh(widget.device.id);
    final wol = await _repo.loadWol(widget.device.id);
    if (mounted) {
      setState(() {
        _sshCreds = ssh;
        _wolConfig = wol;
        _loadingCreds = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final sshState = ref.watch(sshProvider);

    if (_loadingCreds) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _InfoCard(device: widget.device),
          const SizedBox(height: 16),
          // ── Wake-on-LAN ─────────────────────────────────────
          _SectionHeader('Alimentation'),
          _WolSection(
            wolConfig: _wolConfig,
            deviceId: widget.device.id,
            onConfigSaved: _loadCredentials,
          ),
          const SizedBox(height: 16),
          // ── SSH ─────────────────────────────────────────────
          _SectionHeader('Contrôle à distance (SSH)'),
          _SshSection(
            sshCreds: _sshCreds,
            sshState: sshState,
            deviceId: widget.device.id,
            onConfigSaved: _loadCredentials,
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final Device device;
  const _InfoCard({required this.device});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(device.displayName,
                style: Theme.of(context).textTheme.titleLarge),
            if (device.ipAddress != null) Text('IP: ${device.ipAddress}'),
            if (device.macAddress != null) Text('MAC: ${device.macAddress}'),
          ],
        ),
      ),
    );
  }
}

class _WolSection extends ConsumerWidget {
  final WolConfig? wolConfig;
  final String deviceId;
  final VoidCallback onConfigSaved;

  const _WolSection({
    required this.wolConfig,
    required this.deviceId,
    required this.onConfigSaved,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.power),
          label: const Text('Allumer (Wake-on-LAN)'),
          onPressed: wolConfig != null
              ? () => ref.read(wolProvider.notifier).wake(wolConfig!)
              : null,
        ),
        if (wolConfig == null)
          TextButton(
            onPressed: () => _showWolDialog(context, ref),
            child: const Text('Configurer WoL (adresse MAC)'),
          ),
      ],
    );
  }

  void _showWolDialog(BuildContext context, WidgetRef ref) {
    final macController = TextEditingController();
    final broadcastController = TextEditingController(text: '192.168.1.255');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Configurer Wake-on-LAN'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: macController,
              decoration: const InputDecoration(
                  labelText: 'Adresse MAC (AA:BB:CC:DD:EE:FF)'),
            ),
            TextField(
              controller: broadcastController,
              decoration:
                  const InputDecoration(labelText: 'IP Broadcast'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () async {
              final config = WolConfig(
                deviceId: deviceId,
                macAddress: macController.text.trim(),
                broadcastIp: broadcastController.text.trim(),
              );
              await CredentialsRepository().saveWol(config);
              if (ctx.mounted) Navigator.pop(ctx);
              onConfigSaved();
            },
            child: const Text('Sauvegarder'),
          ),
        ],
      ),
    );
  }
}

class _SshSection extends ConsumerWidget {
  final SshCredentials? sshCreds;
  final AsyncValue<bool> sshState;
  final String deviceId;
  final VoidCallback onConfigSaved;

  const _SshSection({
    required this.sshCreds,
    required this.sshState,
    required this.deviceId,
    required this.onConfigSaved,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connected = sshState.valueOrNull ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!connected)
          ElevatedButton.icon(
            icon: const Icon(Icons.login),
            label: Text(
              sshState.isLoading ? 'Connexion...' : 'Connecter via SSH',
            ),
            onPressed: sshCreds != null && !sshState.isLoading
                ? () => ref.read(sshProvider.notifier).connect(sshCreds!)
                : null,
          ),
        if (connected) ...[
          OutlinedButton.icon(
            icon: const Icon(Icons.restart_alt),
            label: const Text('Redémarrer'),
            onPressed: () =>
                ref.read(sshProvider.notifier).restart(),
          ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            icon: const Icon(Icons.power_off),
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red),
            label: const Text('Éteindre'),
            onPressed: () =>
                ref.read(sshProvider.notifier).shutdown(),
          ),
        ],
        if (sshCreds == null)
          TextButton(
            onPressed: () => _showSshDialog(context, ref),
            child: const Text('Configurer SSH'),
          ),
        if (sshState.hasError)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              'Erreur SSH: ${sshState.error}',
              style: const TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  void _showSshDialog(BuildContext context, WidgetRef ref) {
    final hostController = TextEditingController();
    final userController = TextEditingController();
    final passController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Configurer SSH'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: hostController,
              decoration: const InputDecoration(labelText: 'Hôte / IP'),
            ),
            TextField(
              controller: userController,
              decoration: const InputDecoration(labelText: 'Utilisateur'),
            ),
            TextField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Mot de passe'),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () async {
              final creds = SshCredentials(
                deviceId: deviceId,
                host: hostController.text.trim(),
                username: userController.text.trim(),
                password: passController.text,
              );
              await CredentialsRepository().saveSsh(creds);
              if (ctx.mounted) Navigator.pop(ctx);
              onConfigSaved();
            },
            child: const Text('Sauvegarder'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
      );
}
