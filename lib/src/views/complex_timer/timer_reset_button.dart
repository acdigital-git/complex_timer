import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerResetButton extends HookWidget {
  const TimerResetButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = useProvider(timerStatusProvider);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
        onPressed: status != TimerStatus.initial
            ? () => context.read(complexTimerProvider.notifier).resetTimer()
            : null,
        icon: Icon(
          Icons.restore_rounded,
          size: 34.0,
        ),
        label: Text(
          'Reset',
          style: TextStyle(fontSize: 28.0),
        ),
      ),
    );
  }
}
