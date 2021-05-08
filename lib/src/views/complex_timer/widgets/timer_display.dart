import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerDisplay extends HookWidget {
  const TimerDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _complexTimerValue =
        useProvider(complexTimerProvider.select((timer) => timer.duration));
    return Material(
      borderRadius: BorderRadius.circular(6.0),
      clipBehavior: Clip.antiAlias,
      elevation: AppStyles.elevation,
      shadowColor: AppStyles.lightClr,
      color: AppStyles.mediumClr,
      child: Center(
        child: Text(
          _complexTimerValue,
          style: TextStyle(
            fontSize: 64.0,
            color: Colors.grey.shade800,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
