import 'package:flutter/material.dart';

class AppStyles {
  static const elevation = 2.25;
  // Colors
  static final Color scaffoldBg = Colors.grey.shade700;
  static final Color primaryClr = Colors.grey.shade800;
  static final Color mediumClr = Colors.grey.shade500;
  static final Color lightClr = Colors.grey.shade400;
  static const Color shadowClr = Colors.deepOrange;
  // AppBar
  static const double toolbarHeight = 80.0;
  // ThemeData
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: scaffoldBg,
    primaryColor: primaryClr,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.white),
    ),
    dividerColor: lightClr,
    dividerTheme: DividerThemeData(
      indent: 64.0,
      endIndent: 64.0,
      thickness: 2.5,
    ),
  );
}
