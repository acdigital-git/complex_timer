import 'package:flutter/material.dart';

class CurrentTimeView extends StatelessWidget {
  const CurrentTimeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
        child: Text(
          '00:00:00',
          style: TextStyle(
            fontSize: 46.0,
          ),
        ),
      ),
    );
  }
}
