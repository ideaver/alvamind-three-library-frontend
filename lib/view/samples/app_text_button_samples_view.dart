import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/molecule/app_text_button.dart';
import 'package:flutter/material.dart';

import '___sample_wrapper.dart';

class AppTextButtonSamplesView extends StatefulWidget {
  const AppTextButtonSamplesView({super.key});

  static const routeName = '/atom-app-text-button';

  @override
  State<AppTextButtonSamplesView> createState() => _AppTextButtonSamplesViewState();
}

class _AppTextButtonSamplesViewState extends State<AppTextButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Button Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTextButton(),
            customTextButton(),
          ],
        ),
      ),
    );
  }

  Widget defaultTextButton() {
    return SampleWrapper(
      title: 'Default Text Button',
      widget: AppTextButton(
        text: 'Text Button',
        onTap: () {},
      ),
    );
  }

  Widget customTextButton() {
    return SampleWrapper(
      title: 'Custom Text Button',
      widget: AppTextButton(
        text: 'Custom Text Button',
        padding: const EdgeInsets.all(AppSizes.padding),
        textColor: AppColors.redLv1,
        onTap: () {},
      ),
    );
  }
}
