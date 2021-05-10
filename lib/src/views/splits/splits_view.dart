import 'package:complex_timer/core/providers/stopwatch_provider.dart';
import 'package:complex_timer/src/constants/app_styles.dart';
import 'package:complex_timer/src/shared/scaffold/appbar_widget.dart';
import 'package:complex_timer/src/shared/scaffold/extended_fab.dart';
import 'package:complex_timer/src/views/splits/widgets/splits_filter_switch.dart';
import 'package:complex_timer/src/views/splits/widgets/splits_listview.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplitsView extends StatelessWidget {
  SplitsView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(
            title: title,
            height: AppStyles.toolbarHeight,
            actions: [
              SplitsFilterSwitch(),
            ]),
        body: SplitsListView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: buildExtendedFAB(
          label: 'CLEAR',
          icon: Icons.delete_sweep_rounded,
          txtClr: AppStyles.lightClr,
          bgClr: Colors.redAccent,
          callback: () => {
            context.read(splitsNotifier.notifier).clear(),
            Navigator.pop(context)
          },
        ),
      ),
    );
  }
}
