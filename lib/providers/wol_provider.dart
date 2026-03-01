import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/wol_service.dart';
import '../models/wol_config.dart';

final wolServiceProvider = Provider<WolService>((_) => WolService());

class WolNotifier extends StateNotifier<AsyncValue<WolResult?>> {
  WolNotifier(this._service) : super(const AsyncData(null));

  final WolService _service;

  Future<void> wake(WolConfig config) async {
    state = const AsyncLoading();
    final result = await _service.wake(config);
    state = AsyncData(result);
  }
}

final wolProvider =
    StateNotifierProvider.autoDispose<WolNotifier, AsyncValue<WolResult?>>(
  (ref) => WolNotifier(ref.watch(wolServiceProvider)),
);
