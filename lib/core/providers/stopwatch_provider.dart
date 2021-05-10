import 'package:complex_timer/core/models/timer_result.dart';
import 'package:complex_timer/core/services/complex_timer_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final complexTimerProvider = ChangeNotifierProvider<ComplexTimerService>((ref) {
  final _results = ref.watch(complexTimerResultsNotifier.notifier);
  return ComplexTimerService(results: _results);
});

final complexTimerResultsNotifier =
    StateNotifierProvider<ComplexTimerResultsNotifier, List<TimerResult>>(
  (ref) => ComplexTimerResultsNotifier(),
);

final resultsEmptyProvider =
    Provider<bool>((ref) => ref.watch(complexTimerResultsNotifier).isEmpty);

class ComplexTimerResultsNotifier extends StateNotifier<List<TimerResult>> {
  ComplexTimerResultsNotifier([List<TimerResult>? initialResults])
      : super(initialResults ?? []);

  void add({required String timerValue}) {
    print('Before : ' + state.length.toString());
    state = [
      ...state,
      TimerResult(id: (state.length - 1), value: timerValue),
    ];
    print('After : ' + state.length.toString());
  }

  void clear() => state = [];
}
