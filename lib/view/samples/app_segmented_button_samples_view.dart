import 'package:flutter/material.dart';

import '../../app/utility/console_log.dart';
import '../../model/tab_bar_model.dart';
import '../../widget/molecule/app_segmented_tab_bar.dart';
import '___sample_wrapper.dart';

class AppSegmentedButtonSamplesView extends StatefulWidget {
  const AppSegmentedButtonSamplesView({super.key});

  static const routeName = '/molecule-app-segmented-button';

  @override
  State<AppSegmentedButtonSamplesView> createState() => _AppSegmentedButtonSamplesViewState();
}

class _AppSegmentedButtonSamplesViewState extends State<AppSegmentedButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Button Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSegmentedButton(),
          ],
        ),
      ),
    );
  }

  Widget defaultSegmentedButton() {
    return SampleWrapper(
      title: 'Default Segmented Button',
      widget: AppSegmentedTabBar(
        tabs: [
          TabBarModel(
            label: 'Label 1',
            icon: Icons.dashboard_customize_outlined,
          ),
          TabBarModel(
            label: 'Label 2',
            icon: Icons.add_chart,
          )
        ],
        onChangedTab: (index) {
          cl(index);
        },
      ),
    );
  }
}
