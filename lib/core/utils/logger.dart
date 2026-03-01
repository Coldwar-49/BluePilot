import 'package:flutter/foundation.dart';

class Logger {
  static void info(String tag, Object msg) {
    if (kDebugMode) debugPrint('[$tag] INFO: $msg');
  }

  static void warn(String tag, Object msg) {
    if (kDebugMode) debugPrint('[$tag] WARN: $msg');
  }

  static void error(String tag, Object err) {
    if (kDebugMode) debugPrint('[$tag] ERROR: $err');
  }
}
