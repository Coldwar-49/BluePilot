import 'dart:io';
import 'dart:typed_data';
import '../models/wol_config.dart';
import '../core/utils/logger.dart';

enum WolResult { sent, invalidMac, invalidIp, error }

class WolService {
  /// Sends a Wake-on-LAN magic packet to the given [config].
  Future<WolResult> wake(WolConfig config) async {
    try {
      final mac = _parseMac(config.macAddress);
      if (mac == null) {
        Logger.warn('WolService', 'Invalid MAC: ${config.macAddress}');
        return WolResult.invalidMac;
      }

      // Build magic packet: 6x 0xFF + 16x MAC address
      final packet = Uint8List(102);
      for (var i = 0; i < 6; i++) {
        packet[i] = 0xFF;
      }
      for (var rep = 0; rep < 16; rep++) {
        for (var b = 0; b < 6; b++) {
          packet[6 + rep * 6 + b] = mac[b];
        }
      }

      final socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
      socket.broadcastEnabled = true;
      final target = InternetAddress(config.broadcastIp);

      for (var i = 0; i < 3; i++) {
        socket.send(packet, target, config.port);
        await Future.delayed(const Duration(milliseconds: 100));
      }
      socket.close();

      Logger.info('WolService', 'Magic packet sent to ${config.macAddress}');
      return WolResult.sent;
    } catch (e) {
      Logger.error('WolService.wake', e);
      return WolResult.error;
    }
  }

  List<int>? _parseMac(String mac) {
    final parts = mac.split(RegExp(r'[:\-]'));
    if (parts.length != 6) return null;
    try {
      return parts.map((p) => int.parse(p, radix: 16)).toList();
    } catch (_) {
      return null;
    }
  }
}
