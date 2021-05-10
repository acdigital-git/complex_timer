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
    title: Text(
      title,
      style: const TextStyle(fontSize: 26.0),
    ),
  );
}
