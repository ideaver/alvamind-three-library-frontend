import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_radio.dart';
import '___sample_wrapper.dart';

class AppRadioSamplesView extends StatefulWidget {
  const AppRadioSamplesView({super.key});

  static const routeName = '/molecule-app-radio';

  @override
  State<AppRadioSamplesView> createState() => _AppRadioSamplesViewState();
}

class _AppRadioSamplesViewState extends State<AppRadioSamplesView> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Samples')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // defaultRadio(),
            // defaultRadioListTileWithSubitle(),
            // defaultRadioListTileWithTitleDisabled(),
            // defaultRadioListTileWithTitleCustom(),
          ],
        ),
      ),
    );
  }

  Widget defaultRadio() {
    return SampleWrapper(
      title: 'Default Radio',
      widget: AppRadio(
        value: 1,
        groupValue: groupValue,
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
      ),
    );
  }

  Widget defaultRadioListTileWithSubitle() {
    return SampleWrapper(
      title: 'Default Radio With Title',
      widget: AppRadio(
        value: 2,
        groupValue: groupValue,
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
        title: 'Radio Sample',
      ),
    );
  }

  Widget defaultRadioListTileWithTitleDisabled() {
    return SampleWrapper(
      title: 'Default Radio With Title Disabled',
      widget: AppRadio(
        enable: false,
        value: 3,
        groupValue: groupValue,
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
        title: 'Radio Sample',
      ),
    );
  }

  Widget defaultRadioListTileWithTitleCustom() {
    return SampleWrapper(
      title: 'Default Radio With Title Custom',
      widget: AppRadio(
        value: 4,
        groupValue: groupValue,
        onChanged: (val) {
          groupValue = val as int;
          setState(() {});
        },
        title: 'Radio Sample',
        titleStyle: AppTextStyle.bold(size: 14, color: AppColors.primary),
        activeColor: AppColors.redLv1,
        fillColor: AppColors.redLv1,
      ),
    );
  }
}
