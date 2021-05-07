import 'package:complex_timer/core/providers/countdown_provider.dart';
import 'package:complex_timer/src/constants/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CountdownTimeView extends HookWidget {
  const CountdownTimeView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    final value = useProvider(countdownValueProvider);
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
        ),
        AppUtils.hSmallSpace,
        Card(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 46.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
