import 'package:alvamind_three_library_frontend/app/utility/console_log.dart';
import 'package:alvamind_three_library_frontend/model/tab_bar_model.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_tab_bar.dart';
import 'package:flutter/material.dart';

import 'sample_wrapper.dart';

class TabBarSamplesView extends StatefulWidget {
  const TabBarSamplesView({super.key});

  static const routeName = '/molecule-app-tab-bar';

  @override
  State<TabBarSamplesView> createState() => _TabBarSamplesViewState();
}

class _TabBarSamplesViewState extends State<TabBarSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Bar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTabBar(),
          ],
        ),
      ),
    );
  }

  Widget defaultTabBar() {
    return SampleWrapper(
      title: 'Default Tab Bar',
      widget: AppTabBar(
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
