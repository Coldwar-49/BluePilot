import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_tools/network_tools.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force UTF-8 code page on Windows so system commands (arp, ping, etc.)
  // output UTF-8 text instead of the local code page (CP850/CP1252).
  // This prevents FormatException when network_tools parses the ARP table.
  if (Platform.isWindows) {
    try {
      await Process.run('chcp', ['65001'], runInShell: true);
    } catch (_) {}
  }

  // Initialize network_tools (ARP + vendor tables).
  // Non-fatal: if it fails (e.g. encoding issues on some locales),
  // the app continues without ARP/vendor enrichment.
  try {
    await configureNetworkTools(Directory.systemTemp.path);
  } catch (e) {
    if (kDebugMode) debugPrint('[main] network_tools init skipped: $e');
  }

  runApp(
    const ProviderScope(
      child: BluePilotApp(),
    ),
  );
}
