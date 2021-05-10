import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LastSplitValue extends HookWidget {
  const LastSplitValue({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _lastCp = useProvider(lastSplitProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'last split :',
          style: TextStyle(color: AppStyles.primaryClr),
        ),
        Row(
          children: [
            const Icon(
              Icons.subdirectory_arrow_right_rounded,
              color: Colors.deepPurple,
              size: 28.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              _lastCp,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppStyles.accentClr,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
