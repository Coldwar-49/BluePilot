import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../models/device.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/device_control/device_control_screen.dart';
import '../../screens/settings/settings_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (ctx, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/device',
        builder: (ctx, state) {
          final device = state.extra as Device;
          return DeviceControlScreen(device: device);
        },
      ),
      GoRoute(
        path: '/settings',
        builder: (ctx, state) => const SettingsScreen(),
      ),
    ],
  );
});
