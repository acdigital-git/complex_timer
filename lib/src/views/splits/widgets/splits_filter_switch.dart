import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplitsFilterSwitch extends HookWidget {
  const SplitsFilterSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isFiltered = useProvider(splitsFilterNotifier);
    return Row(
      children: [
        Text(_isFiltered ? 'ASC' : 'DESC'),
        Switch(
          value: _isFiltered,
          onChanged: (value) =>
              context.read(splitsFilterNotifier.notifier).toggle(),
        ),
      ],
    );
  }
}
