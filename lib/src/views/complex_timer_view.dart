import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:complex_timer/src/shared/scaffold/appbar_widget.dart';
import 'package:complex_timer/src/views/complex_timer/timer_reset_button.dart';
import 'package:complex_timer/src/views/complex_timer/timer_display.dart';
import 'package:complex_timer/src/views/complex_timer/timer_play_button.dart';
import 'package:flutter/material.dart';

class ComplexTimerView extends StatelessWidget {
  ComplexTimerView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    print('**build base view**');
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          title: title,
          height: AppStyles.toolbarHeight,
        ),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: TimerDisplay(),
              ),
              AppUtils.hMediumSpace,
              Expanded(
                flex: 5,
                child: PlayButton(),
              ),
              AppUtils.hMediumSpace,
              Expanded(
                flex: 1,
                child: TimerResetButton(),
              )
              /* CurrentTimeView(title: 'Stopwatch Timer'),
              AppUtils.hSmallSpace,
              TimerActionsView(), */
            ],
          ),
        ),
      ),
    );
  }
}
