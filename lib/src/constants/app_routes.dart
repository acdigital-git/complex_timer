import 'package:complex_timer/src/constants/app_titles.dart';
import 'package:complex_timer/src/views/complex_timer/complex_timer_results.dart';
import 'package:complex_timer/src/views/complex_timer/complex_timer_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const complexTimer = '/';
  static const complexTimerResults = '/results';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case complexTimer:
        return MaterialPageRoute(
            builder: (_) => ComplexTimerView(title: AppTitles.complexTimer));
      case complexTimerResults:
        return MaterialPageRoute(
            builder: (_) =>
                ComplexTimerResultsView(title: AppTitles.complexTimerResults));
      default:
        return _errorRoute();
    }
  }

  // error route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Page introuvable'),
              const SizedBox(),
              ElevatedButton.icon(
                  onPressed: () => Navigator.of(_)
                      .pushNamedAndRemoveUntil('/', (route) => false),
                  icon: Icon(Icons.home_rounded),
                  label: Text('Complex Timer'))
            ],
          )),
        ),
      );
    });
  }
}
