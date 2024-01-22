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
        title: 'Toggle Sample',
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
        title: 'Toggle Sample',
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
        title: 'Toggle Sample',
        titleStyle: AppTextStyle.bold(size: 14, color: AppColors.redLv1),
        activeColor: AppColors.blackLv1,
        inactiveColor: AppColors.blackLv4,
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
        title: 'Custom Toggle',
        showInactiveIcon: true,
        activeColor: AppColors.blackLv1,
        inactiveColor: AppColors.blackLv4,
      ),
    );
  }
}
