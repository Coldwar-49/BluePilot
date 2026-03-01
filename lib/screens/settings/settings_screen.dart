import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/device.dart';
import '../../repositories/device_repository.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _repo = DeviceRepository();
  List<Device> _saved = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final saved = await _repo.loadSaved();
    if (mounted) setState(() => _saved = saved);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: _saved.isEmpty
          ? const Center(
              child: Text(
                'Aucun appareil sauvegardé.\nConnectez-vous à un appareil et sauvegardez-le.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _saved.length,
              itemBuilder: (ctx, i) {
                final d = _saved[i];
                return ListTile(
                  leading: const Icon(Icons.devices),
                  title: Text(d.displayName),
                  subtitle: Text(d.ipAddress ?? d.macAddress ?? ''),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await _repo.remove(d.id);
                      _load();
                    },
                  ),
                );
              },
            ),
    );
  }
}
