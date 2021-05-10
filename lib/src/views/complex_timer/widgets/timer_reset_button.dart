import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerResetButton extends HookWidget {
  const TimerResetButton({
    Key? key,
    required AnimationController animationController,
  })   : _animationController = animationController,
        super(key: key);

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final _initialStatus =
        useProvider(complexTimerProvider.select((timer) => timer.status)) ==
            TimerStatus.initial;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
        onPressed: _initialStatus
            ? null
            : () {
                context.read(complexTimerProvider).resetTimer();
                _animationController.reverse();
              },
        icon: Icon(
          Icons.restore_rounded,
          size: AppStyles.iconSize,
        ),
        label: Text(
          'Reset timer',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}
