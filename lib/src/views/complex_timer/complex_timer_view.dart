import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:complex_timer/src/shared/scaffold/appbar_widget.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/results_nav_button.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_reset_button.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_display/timer_display.dart';
import 'package:complex_timer/src/views/complex_timer/widgets/timer_play_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ComplexTimerView extends HookWidget {
  ComplexTimerView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final _animController =
        useAnimationController(duration: const Duration(milliseconds: 300));
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          title: title,
          height: AppStyles.toolbarHeight,
          actions: [ResultsNavButton()],
        ),
        body: Container(
          padding: const EdgeInsets.all(32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 3,
                child: TimerDisplayView(),
              ),
              AppUtils.hMediumSpace,
              Expanded(
                flex: 5,
                child: PlayButton(animationController: _animController),
              ),
              AppUtils.hMediumSpace,
              Expanded(
                flex: 1,
                child: TimerResetButton(animationController: _animController),
              )
            ],
          ),
        ),
      ),
    );
  }
}
