import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../../../models/device.dart';

class BleControlPanel extends StatefulWidget {
  final Device device;
  const BleControlPanel({super.key, required this.device});

  @override
  State<BleControlPanel> createState() => _BleControlPanelState();
}

class _BleControlPanelState extends State<BleControlPanel> {
  BluetoothDevice? _btDevice;
  List<BluetoothService> _services = [];
  bool _connecting = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    setState(() {
      _connecting = true;
      _error = null;
    });
    try {
      _btDevice = BluetoothDevice.fromId(widget.device.macAddress!);
      await _btDevice!.connect(timeout: const Duration(seconds: 10));
      final services = await _btDevice!.discoverServices();
      if (mounted) setState(() => _services = services);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _connecting = false);
    }
  }

  @override
  void dispose() {
    _btDevice?.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_connecting) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Connexion Bluetooth...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.bluetooth_disabled, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Erreur: $_error'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
              onPressed: _connect,
            ),
          ],
        ),
      );
    }

    if (_services.isEmpty) {
      return const Center(child: Text('Aucun service GATT trouvé.'));
    }

    return ListView.builder(
      itemCount: _services.length,
      itemBuilder: (ctx, i) => _ServiceTile(service: _services[i]),
    );
  }
}

class _ServiceTile extends StatelessWidget {
  final BluetoothService service;
  const _ServiceTile({required this.service});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.settings_input_component),
      title: Text(
        service.uuid.toString().toUpperCase(),
        style: const TextStyle(fontSize: 13, fontFamily: 'monospace'),
      ),
      children: service.characteristics.map((c) {
        return ListTile(
          title: Text(
            c.uuid.toString().toUpperCase(),
            style: const TextStyle(fontSize: 12, fontFamily: 'monospace'),
          ),
          subtitle: Text(_propStr(c.properties)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (c.properties.read)
                IconButton(
                  icon: const Icon(Icons.download, size: 20),
                  tooltip: 'Lire',
                  onPressed: () => _read(context, c),
                ),
              if (c.properties.write || c.properties.writeWithoutResponse)
                IconButton(
                  icon: const Icon(Icons.upload, size: 20),
                  tooltip: 'Écrire',
                  onPressed: () => _write(context, c),
                ),
              if (c.properties.notify || c.properties.indicate)
                IconButton(
                  icon: const Icon(Icons.notifications, size: 20),
                  tooltip: 'Notifier',
                  onPressed: () => _subscribe(c),
                ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _propStr(CharacteristicProperties p) {
    final props = <String>[];
    if (p.read) props.add('Read');
    if (p.write) props.add('Write');
    if (p.notify) props.add('Notify');
    if (p.indicate) props.add('Indicate');
    return props.join(', ');
  }

  Future<void> _read(BuildContext ctx, BluetoothCharacteristic c) async {
    try {
      final value = await c.read();
      if (ctx.mounted) {
        showDialog(
          context: ctx,
          builder: (dialogCtx) => AlertDialog(
            title: const Text('Valeur lue'),
            content: Text(value.toString()),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(dialogCtx),
                  child: const Text('OK'))
            ],
          ),
        );
      }
    } catch (e) {
      if (ctx.mounted) {
        ScaffoldMessenger.of(ctx).showSnackBar(
            SnackBar(content: Text('Erreur lecture: $e')));
      }
    }
  }

  void _write(BuildContext ctx, BluetoothCharacteristic c) {
    final controller = TextEditingController();
    showDialog(
      context: ctx,
      builder: (dialogCtx) => AlertDialog(
        title: const Text('Écrire des octets (hex séparés par espace)'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'ex: 01 02 FF'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(dialogCtx),
              child: const Text('Annuler')),
          ElevatedButton(
            onPressed: () async {
              final bytes = controller.text
                  .trim()
                  .split(' ')
                  .map((s) => int.tryParse(s, radix: 16) ?? 0)
                  .toList();
              await c.write(bytes);
              if (dialogCtx.mounted) Navigator.pop(dialogCtx);
            },
            child: const Text('Envoyer'),
          ),
        ],
      ),
    );
  }

  Future<void> _subscribe(BluetoothCharacteristic c) async {
    await c.setNotifyValue(true);
  }
}
