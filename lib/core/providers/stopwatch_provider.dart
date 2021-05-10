import 'package:complex_timer/core/models/split.dart';
import 'package:complex_timer/core/services/complex_timer_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Service
final complexTimerProvider = ChangeNotifierProvider<ComplexTimerService>((ref) {
  final _results = ref.watch(splitsNotifier.notifier);
  return ComplexTimerService(results: _results);
});

// Splits
final splitsFilterNotifier = StateNotifierProvider<SplitsFilterNotifier, bool>(
  (ref) => SplitsFilterNotifier(),
);

final splitsNotifier = StateNotifierProvider<SplitsNotifier, List<Split>>(
  (ref) => SplitsNotifier(),
);

final filteredSplitsProvider = Provider<List<Split>>((ref) {
  final _results = ref.watch(splitsNotifier);
  final _isFiltered = ref.watch(splitsFilterNotifier);
  return _isFiltered ? _results.reversed.toList() : _results;
});

final lastSplitProvider = Provider<String>((ref) {
  final _results = ref.watch(splitsNotifier);
  final _lenght = _results.length;
  return _lenght != 0 ? _results.elementAt(_lenght - 1).value : '00:00:000';
});

final splitsEmptyProvider =
    Provider<bool>((ref) => ref.watch(splitsNotifier).isEmpty);

class SplitsNotifier extends StateNotifier<List<Split>> {
  SplitsNotifier([List<Split>? initialResults]) : super(initialResults ?? []);

  void add({required String timerValue}) => state = [
        ...state,
        Split(id: (state.length), value: timerValue),
      ];

  void clear() => state = [];
}

class SplitsFilterNotifier extends StateNotifier<bool> {
  SplitsFilterNotifier([bool? initialValue]) : super(initialValue ?? false);

  void toggle() => state = !state;
}
