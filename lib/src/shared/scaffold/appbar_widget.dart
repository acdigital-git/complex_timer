import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(
    {required String title,
    double? height,
    List<Widget>? actions,
    bool centerTitle = false}) {
  return AppBar(
    toolbarHeight: height ?? kToolbarHeight,
    actions: actions,
    centerTitle: centerTitle,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.timer_rounded,
          size: 34.0,
        ),
        AppUtils.wSmallSpace,
        Text(
          title,
          style: const TextStyle(fontSize: 26.0),
        ),
      ],
    ),
  );
}
