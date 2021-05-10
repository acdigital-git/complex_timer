import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/shared/components/listile_widget.dart';
import 'package:complex_timer/src/shared/scaffold/appbar_widget.dart';
import 'package:complex_timer/src/shared/scaffold/extended_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ComplexTimerResultsView extends HookWidget {
  ComplexTimerResultsView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    print('**build results view**');
    final _results = useProvider(complexTimerResultsNotifier);
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
          title: title,
          height: AppStyles.toolbarHeight,
          centerTitle: true,
        ),
        body: ListView.separated(
          padding: const EdgeInsets.all(32.0),
          itemBuilder: (context, index) =>
              buildListTile(result: _results[index]),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: _results.length,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: buildExtendedFAB(
          label: 'CLEAR ALL',
          icon: Icons.delete_outline_rounded,
          txtClr: AppStyles.lightClr,
          bgClr: Colors.redAccent,
          callback: context.read(complexTimerResultsNotifier.notifier).clear,
        ),
      ),
    );
  }
}
