import 'package:complex_timer/core/models/split.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

ListTile buildListTile({required Split result}) {
  return ListTile(
    leading: Icon(
      Icons.subdirectory_arrow_right_rounded,
      size: AppStyles.iconSize,
    ),
    title: Row(
      children: [
        Icon(Icons.alarm_on_rounded),
        const SizedBox(width: 8.0),
        Text(
          (result.id + 1).toString() + ' | ' + result.value,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}
