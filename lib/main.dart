import 'package:complex_timer/src/constants/app_globals.dart';
import 'package:complex_timer/src/constants/app_routes.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppGlobals.name,
      theme: AppStyles.theme,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutes.complexTimer,
    );
  }
}
