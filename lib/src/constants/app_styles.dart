import 'package:flutter/material.dart';

class AppStyles {
  // Colors
  static final Color scaffoldBg = Colors.grey.shade700;
  static final Color primaryClr = Colors.grey.shade800;
  // AppBar
  static const double toolbarHeight = 65.0;
  // ThemeData
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: scaffoldBg,
    primaryColor: primaryClr,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.white)),
  );
}
