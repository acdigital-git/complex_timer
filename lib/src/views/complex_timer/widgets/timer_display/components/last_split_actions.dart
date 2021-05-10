import 'package:complex_timer/core/models/timer_status_enum.dart';
import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_routes.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LastSplitActions extends HookWidget {
  const LastSplitActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _empty = useProvider(splitsEmptyProvider);
    final _isRunning =
        useProvider(complexTimerProvider.select((timer) => timer.status)) ==
            TimerStatus.running;
    return Row(
      children: [
        InkWell(
          onTap: _isRunning
              ? context.read(complexTimerProvider.notifier).createSplit
              : null,
          child: Icon(
            Icons.add_alarm_outlined,
            color: _isRunning ? AppStyles.accentClr : AppStyles.scaffoldBg,
            size: AppStyles.iconSize,
          ),
        ),
        const SizedBox(width: 18.0),
        InkWell(
          onTap: _empty
              ? null
              : () =>
                  Navigator.pushNamed(context, AppRoutes.complexTimerSplits),
          child: Icon(
            Icons.list_alt_rounded,
            color: _empty ? AppStyles.scaffoldBg : AppStyles.accentClr,
            size: AppStyles.iconSize,
          ),
        )
      ],
    );
  }
}
