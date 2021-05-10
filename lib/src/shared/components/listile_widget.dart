import 'package:complex_timer/core/models/timer_result.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

ListTile buildListTile({required TimerResult result}) {
  return ListTile(
    leading: Icon(
      Icons.alarm_on_rounded,
      size: AppStyles.iconSize,
    ),
    title: Text(
      result.value,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
    ),
  );
}
