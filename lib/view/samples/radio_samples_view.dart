import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_radio.dart';
import 'sample_wrapper.dart';

class RadioSamplesView extends StatefulWidget {
  const RadioSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-radio-samples';

  @override
  State<RadioSamplesView> createState() => _RadioSamplesViewState();
}

class _RadioSamplesViewState extends State<RadioSamplesView> {
  int groupValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Radio Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultRadio(),
            defaultRadioWithTitle(),
            defaultRadioWithTitleDisabled(),
            defaultRadioWithTitleCustom(),
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

  Widget defaultRadioWithTitle() {
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

  Widget defaultRadioWithTitleDisabled() {
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

  Widget defaultRadioWithTitleCustom() {
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
