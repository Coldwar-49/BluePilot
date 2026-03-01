import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/device.dart';

class DeviceRepository {
  static const _key = 'saved_devices';

  Future<List<Device>> loadSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getStringList(_key) ?? [];
    return raw
        .map((s) => Device.fromJson(jsonDecode(s) as Map<String, dynamic>))
        .toList();
  }

  Future<void> save(Device device) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    final idx = list.indexWhere((s) {
      final d = Device.fromJson(jsonDecode(s) as Map<String, dynamic>);
      return d.id == device.id;
    });
    final json = jsonEncode(device.toJson());
    if (idx >= 0) {
      list[idx] = json;
    } else {
      list.add(json);
    }
    await prefs.setStringList(_key, list);
  }

  Future<void> remove(String deviceId) async {
    final prefs = await SharedPreferences.getInstance();
    final list = (prefs.getStringList(_key) ?? []).where((s) {
      final d = Device.fromJson(jsonDecode(s) as Map<String, dynamic>);
      return d.id != deviceId;
    }).toList();
    await prefs.setStringList(_key, list);
  }
}
