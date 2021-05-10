import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/shared/components/listile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplitsListView extends HookWidget {
  const SplitsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final _results = useProvider(splitsNotifier);
    final _filteredSplits = useProvider(filteredSplitsProvider);
    return ListView.separated(
      padding: const EdgeInsets.all(32.0),
      itemBuilder: (context, index) =>
          buildListTile(result: _filteredSplits[index]),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _filteredSplits.length,
    );
  }
}
