import 'package:flutter/material.dart';

class TimerActionsView extends StatelessWidget {
  const TimerActionsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () => print('Start timer'),
          icon: Icon(Icons.play_arrow_rounded),
          label: Text('Start'),
        ),
        ElevatedButton.icon(
          onPressed: () => print('Stop timer'),
          icon: Icon(Icons.stop_rounded),
          label: Text('Stop'),
        ),
        ElevatedButton.icon(
          onPressed: () => print('Reset timer'),
          icon: Icon(Icons.restore_rounded),
          label: Text('Reset'),
        ),
      ],
    );
  }
}
