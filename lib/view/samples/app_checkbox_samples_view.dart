import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_checkbox.dart';
import '___sample_wrapper.dart';

class AppCheckboxSamplesView extends StatefulWidget {
  const AppCheckboxSamplesView({super.key});

  static const routeName = '/molecule-app-checkbox';

  @override
  State<AppCheckboxSamplesView> createState() => _AppCheckboxSamplesViewState();
}

class _AppCheckboxSamplesViewState extends State<AppCheckboxSamplesView> {
  bool? value1 = true;
  bool? value2 = true;
  bool? value3 = false;
  bool? value4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkbox Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultCheckbox(),
            defaultCheckboxWithTitle(),
            defaultCheckboxWithTitleDisabled(),
            defaultCheckboxWithTitleCustom(),
          ],
        ),
      ),
    );
  }

  Widget defaultCheckbox() {
    return SampleWrapper(
      title: 'Default Checkbox',
      widget: AppCheckbox(
        value: value1,
        onChanged: (val) {
          value1 = val;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultCheckboxWithTitle() {
    return SampleWrapper(
      title: 'Default Checkbox With Title',
      widget: AppCheckbox(
        value: value2,
        onChanged: (val) {
          value2 = val;
          setState(() {});
        },
        title: 'Checkbox Sample',
      ),
    );
  }

  Widget defaultCheckboxWithTitleDisabled() {
    return SampleWrapper(
      title: 'Default Checkbox With Title Disabled',
      widget: AppCheckbox(
        enable: false,
        value: value3,
        onChanged: (val) {
          value3 = val;
          setState(() {});
        },
        title: 'Checkbox Sample',
      ),
    );
  }

  Widget defaultCheckboxWithTitleCustom() {
    return SampleWrapper(
      title: 'Default Checkbox With Title Custom',
      widget: AppCheckbox(
        value: value4,
        onChanged: (val) {
          value4 = val;
          setState(() {});
        },
        title: 'Checkbox Sample',
        titleStyle: AppTextStyle.bold(size: 14, color: AppColors.redLv1),
        activeColor: AppColors.redLv1,
        fillColor: AppColors.redLv1,
      ),
    );
  }
}
