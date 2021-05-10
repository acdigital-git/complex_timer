import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

Widget buildExtendedFAB({
  VoidCallback? callback,
  Color? bgClr,
  Color? txtClr,
  TextDirection? txtDirection,
  required String label,
  required IconData icon,
}) {
  return Directionality(
    textDirection: txtDirection ?? TextDirection.ltr,
    child: FloatingActionButton.extended(
      onPressed: callback,
      icon: Icon(
        icon,
        color: txtClr ?? AppStyles.scaffoldBg,
        size: 30,
      ),
      label: Text(
        label,
        style: TextStyle(
          color: txtClr ?? AppStyles.scaffoldBg,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: bgClr ?? AppStyles.lightClr,
    ),
  );
}
