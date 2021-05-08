import 'package:complex_timer/core/services/complex_timer_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final complexTimerProvider =
    ChangeNotifierProvider((ref) => ComplexTimerService());
