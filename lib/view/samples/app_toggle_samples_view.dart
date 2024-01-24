import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_toggle.dart';
import '___sample_wrapper.dart';

class AppToggleSamplesView extends StatefulWidget {
  const AppToggleSamplesView({super.key});

  static const routeName = '/molecule-app-toggle';

  @override
  State<AppToggleSamplesView> createState() => _AppToggleSamplesViewState();
}

class _AppToggleSamplesViewState extends State<AppToggleSamplesView> {
  bool value1 = true;
  bool value2 = true;
  bool value3 = false;
  bool value4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Toggle Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultToggle(),
            defaultToggleWithTitle(),
            defaultToggleWithTitleDisabled(),
            defaultToggleWithTitleCustom(),
            customToggle(),
          ],
        ),
      ),
    );
  }

  Widget defaultToggle() {
    return SampleWrapper(
      title: 'Default Toggle',
      widget: AppToggle(
        value: value1,
        onChanged: (val) {
          value1 = val;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultToggleWithTitle() {
    return SampleWrapper(
      title: 'Default Toggle With Title',
      widget: AppToggle(
        value: value2,
        onChanged: (val) {
          value2 = val;
          setState(() {});
        },
        label: 'Toggle Sample',
      ),
    );
  }

  Widget defaultToggleWithTitleDisabled() {
    return SampleWrapper(
      title: 'Default Toggle With Title Disabled',
      widget: AppToggle(
        enable: false,
        value: value3,
        onChanged: (val) {
          value3 = val;
          setState(() {});
        },
        label: 'Toggle Sample',
      ),
    );
  }

  Widget defaultToggleWithTitleCustom() {
    return SampleWrapper(
      title: 'Default Toggle With Title Custom',
      widget: AppToggle(
        value: value4,
        onChanged: (val) {
          value4 = val;
          setState(() {});
        },
        label: 'Toggle Sample',
        labelStyle: AppTextStyle.bold(size: 14, color: AppColors.redLv1),
      ),
    );
  }

  Widget customToggle() {
    return SampleWrapper(
      title: 'Custom Toggle',
      widget: AppToggle(
        value: value4,
        onChanged: (val) {
          value4 = val;
          setState(() {});
        },
        label: 'Custom Toggle',
        labelStyle: AppTextStyle.bold(size: 14, color: AppColors.redLv1),
        showInactiveIcon: true,
        activeIcon: Icons.menu_rounded,
        inactiveIcon: Icons.grid_view_outlined,
        activeIconColor: AppColors.black,
        inactiveIconColor: AppColors.blackLv5,
        activeColor: AppColors.darkBlueLv6,
        inactiveColor: AppColors.darkBlueLv6,
        childWidth: 50,
        childHeight: 50,
        iconSize: 26,
        toggleMargin: const EdgeInsets.only(right: 16),
      ),
    );
  }
}
