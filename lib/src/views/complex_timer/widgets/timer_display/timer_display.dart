import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_display/components/last_split_actions.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_display/components/last_split_value.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_display/components/timer_value.dart';
import 'package:flutter/material.dart';

class TimerDisplayView extends StatelessWidget {
  const TimerDisplayView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      elevation: AppStyles.elevation,
      borderRadius: BorderRadius.circular(6.0),
      shadowColor: AppStyles.lightClr,
      color: AppStyles.mediumClr,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TimerValue(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LastSplitValue(),
                LastSplitActions(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
