import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/utility/console_log.dart';
import '../../model/tab_bar_model.dart';
import '../../widget/molecule/app_segmented_tab_bar.dart';
import '___sample_wrapper.dart';

class AppSegmentedTabBarSamplesView extends StatefulWidget {
  const AppSegmentedTabBarSamplesView({super.key});

  static const routeName = '/molecule-app-segmented-tab-bar';

  @override
  State<AppSegmentedTabBarSamplesView> createState() => _AppSegmentedTabBarSamplesViewState();
}

class _AppSegmentedTabBarSamplesViewState extends State<AppSegmentedTabBarSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Segmented Tab Bar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSegmentedTabBar(),
            labelOnlySegmentedTabBar(),
            iconOnlySegmentedTabBar(),
            customSegmentedTabBar(),
          ],
        ),
      ),
    );
  }

  Widget defaultSegmentedTabBar() {
    return SampleWrapper(
      title: 'Default Segmented Tab Bar',
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

  Widget labelOnlySegmentedTabBar() {
    return SampleWrapper(
      title: 'Label Only Segmented Tab Bar',
      widget: AppSegmentedTabBar(
        tabs: [
          TabBarModel(
            label: 'Label 1',
          ),
          TabBarModel(
            label: 'Label 2',
          )
        ],
        onChangedTab: (index) {
          cl(index);
        },
      ),
    );
  }

  Widget iconOnlySegmentedTabBar() {
    return SampleWrapper(
      title: 'Icon Only Segmented Tab Bar',
      widget: AppSegmentedTabBar(
        tabs: [
          TabBarModel(
            icon: Icons.dashboard_customize_outlined,
          ),
          TabBarModel(
            icon: Icons.add_chart,
          )
        ],
        onChangedTab: (index) {
          cl(index);
        },
      ),
    );
  }

  Widget customSegmentedTabBar() {
    return SampleWrapper(
      title: 'Custom Segmented Tab Bar',
      widget: AppSegmentedTabBar(
        tabs: [
          TabBarModel(
            label: 'Label 1',
            icon: Icons.dashboard_customize_outlined,
          ),
          TabBarModel(
            label: 'Label 2',
            icon: Icons.add_chart,
          ),
          TabBarModel(
            label: 'Label 3',
            icon: Icons.people_alt_outlined,
          ),
        ],
        backgroundColor: AppColors.blackLv9,
        indicatorColor: AppColors.black,
        labelColor: AppColors.blackLv4,
        iconColor: AppColors.blackLv4,
        activeIconColor: AppColors.white,
        activeLabelColor: AppColors.white,
        borderRadius: 100,
        onChangedTab: (index) {
          cl(index);
        },
      ),
    );
  }
}
