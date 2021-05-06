import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:complex_timer/src/shared/scaffold/appbar_widget.dart';
import 'package:complex_timer/src/views/countdown_actions_view.dart';
import 'package:complex_timer/src/views/countdown_time_view.dart';
import 'package:complex_timer/src/views/current_time_view.dart';
import 'package:complex_timer/src/views/timer_actions_view.dart';
import 'package:flutter/material.dart';

class ComplexTimerView extends StatelessWidget {
  ComplexTimerView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          title: title,
          height: AppStyles.toolbarHeight,
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CurrentTimeView(title: 'Stopwatch Timer'),
              AppUtils.hSmallSpace,
              TimerActionsView(),
              AppUtils.divider64,
              CountdownTimeView(title: 'Countdown Timer'),
              AppUtils.hSmallSpace,
              CountdownActionsView(),
            ],
          ),
        ),
      ),
    );
  }
}
