import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerValue extends HookWidget {
  const TimerValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _complexTimerValue =
        useProvider(complexTimerProvider.select((timer) => timer.duration));
    final _isInitial =
        useProvider(complexTimerProvider.select((timer) => timer.status)) ==
            TimerStatus.initial;
    return Text(
      _complexTimerValue,
      style: TextStyle(
        fontSize: 64.0,
        color: _isInitial ? AppStyles.scaffoldBg : AppStyles.primaryClr,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
