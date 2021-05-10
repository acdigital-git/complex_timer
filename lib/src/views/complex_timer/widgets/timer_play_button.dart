import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayButton extends HookWidget {
  const PlayButton({
    Key? key,
    required AnimationController animationController,
  })   : _animationController = animationController,
        super(key: key);

  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {
    final _timerStatus =
        useProvider(complexTimerProvider.select((timer) => timer.status));

    void _startTimer() {
      context.read(complexTimerProvider).startTimer();
      _animationController.forward();
    }

    void _stopTimer() {
      _animationController.reverse();
      context.read(complexTimerProvider).pauseTimer();
    }

    return Material(
      elevation: AppStyles.elevation,
      shape: CircleBorder(),
      shadowColor: AppStyles.lightClr,
      clipBehavior: Clip.antiAlias,
      color: AppStyles.mediumClr,
      child: InkWell(
        onTap: _timerStatus == TimerStatus.running ? _stopTimer : _startTimer,
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: _timerStatus == TimerStatus.running
                ? Colors.redAccent
                : Colors.teal,
            progress: _animationController,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
