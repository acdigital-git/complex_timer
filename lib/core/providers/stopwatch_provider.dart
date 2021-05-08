import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/services/complex_timer_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final complexTimerProvider =
    ChangeNotifierProvider((ref) => ComplexTimerService());

final timerValueProvider =
    Provider<String>((ref) => ref.watch(complexTimerProvider).currentDuration);
final timerStatusProvider = Provider<TimerStatus>(
    (ref) => ref.watch(complexTimerProvider).currentStatus);
