import 'package:complex_timer/core/providers/countdown_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountdownActionsView extends HookWidget {
  const CountdownActionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = useProvider(countdownStatusProvider);
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.teal),
          onPressed: status != TimerStatus.running
              ? () => context.read(countdownTimerProvider.notifier).startTimer()
              : null,
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.redAccent),
          onPressed: status == TimerStatus.running
              ? () => context.read(countdownTimerProvider.notifier).stopTimer()
              : null,
          icon: Icon(Icons.stop_rounded),
          label: Text('Stop'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(primary: Colors.orangeAccent),
          onPressed: status != TimerStatus.initial
              ? () => context.read(countdownTimerProvider.notifier).resetTimer()
              : null,
          icon: Icon(Icons.restore_rounded),
          label: Text('Reset'),
        ),
      ],
    );
  }
}
