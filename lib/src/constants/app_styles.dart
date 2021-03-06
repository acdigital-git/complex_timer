import 'package:flutter/material.dart';

class AppStyles {
  // Material styles
  static const double elevation = 5.0;
  // Icons
  static const double iconSize = 34.0;
  // Colors
  static final Color scaffoldBg = Colors.grey.shade700;
  static final Color primaryClr = Colors.grey.shade800;
  static final Color mediumClr = Colors.grey.shade500;
  static final Color lightClr = Colors.grey.shade400;
  static final Color accentClr = Colors.deepPurple;
  static final Color successClr = Colors.teal;
  // AppBar
  static const double toolbarHeight = 70.0;
  // ThemeData
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: scaffoldBg,
    primaryColor: primaryClr,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      //centerTitle: true,
      titleSpacing: 32,
      elevation: elevation,
      shadowColor: lightClr,

      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: iconSize,
      ),
    ),
    dividerColor: lightClr,
    dividerTheme: DividerThemeData(
      indent: 64.0,
      endIndent: 64.0,
      thickness: 2.5,
    ),
  );
}
