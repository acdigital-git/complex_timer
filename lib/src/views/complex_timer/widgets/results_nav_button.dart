import 'package:complex_timer/src/constants/app_routes.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ResultsNavButton extends StatelessWidget {
  const ResultsNavButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24.0),
      child: IconButton(
        onPressed: () => Navigator.pushNamed(
          context,
          AppRoutes.complexTimerSplits,
        ),
        icon: Icon(
          Icons.list,
          size: AppStyles.iconSize,
        ),
      ),
    );
  }
}
