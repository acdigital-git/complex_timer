import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimerActionsView extends HookWidget {
  const TimerActionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = useProvider(timerStatusProvider);
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.teal),
          onPressed: status != TimerStatus.running
              ? () => context.read(complexTimerProvider.notifier).startTimer()
              : null,
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          onPressed: status == TimerStatus.running
              ? () => context.read(complexTimerProvider.notifier).stopTimer()
              : null,
          icon: Icon(Icons.stop_rounded),
          label: Text('Stop'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
          onPressed: status != TimerStatus.initial
              ? () => context.read(complexTimerProvider.notifier).resetTimer()
              : null,
          icon: Icon(Icons.restore_rounded),
          label: Text('Reset'),
        ),
      ],
    );
  }
}
