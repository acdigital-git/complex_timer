import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar({required String title, double? height}) {
  return AppBar(
    toolbarHeight: height ?? kToolbarHeight,
    title: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 26.0),
        ),
        AppUtils.wSmallSpace,
        Icon(
          Icons.timer_rounded,
          size: 30.0,
        ),
      ],
    ),
  );
}
