import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:network_tools/network_tools.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize network_tools database (required before any scan)
  final dbDir = Directory.systemTemp.path;
  await configureNetworkTools(dbDir);

  runApp(
    const ProviderScope(
      child: BluePilotApp(),
    ),
  );
}
