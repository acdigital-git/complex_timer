import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PlayButton extends HookWidget {
  const PlayButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animController = useAnimationController(
      duration: const Duration(milliseconds: 300),
    );
    final _currentStatus = useProvider(timerStatusProvider);

    void _startTimer() {
      _animController.forward();
      context.read(complexTimerProvider).startTimer();
    }

    void _stopTimer() {
      _animController.reverse();
      context.read(complexTimerProvider).stopTimer();
    }

    return Material(
      elevation: 5,
      shape: CircleBorder(),
      //shadowColor: AppStyles.primaryClr,
      clipBehavior: Clip.antiAlias,
      color: AppStyles.mediumClr,
      child: InkWell(
        onTap: _currentStatus == TimerStatus.running ? _stopTimer : _startTimer,
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: _currentStatus == TimerStatus.running
                ? Colors.redAccent
                : Colors.teal,
            progress: _animController,
            size: 120.0,
          ),
        ),
      ),
    );
  }
}
