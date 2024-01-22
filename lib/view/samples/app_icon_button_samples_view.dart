import 'package:alvamind_three_library_frontend/app/theme/app_shadows.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_icon_button.dart';
import '___sample_wrapper.dart';

class AppIconButtonSamplesView extends StatefulWidget {
  const AppIconButtonSamplesView({super.key});

  static const routeName = '/molecule-app-icon-button';

  @override
  State<AppIconButtonSamplesView> createState() => _AppIconButtonSamplesViewState();
}

class _AppIconButtonSamplesViewState extends State<AppIconButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icon Button Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultIconButton(),
            iconButtonOutlined(),
            iconButtonDark(),
            iconButtonWithShadow(),
            defaultIconButtonWithText(),
          ],
        ),
      ),
    );
  }

  Widget defaultIconButton() {
    return SampleWrapper(
      title: 'Default Icon Button',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget iconButtonOutlined() {
    return SampleWrapper(
      title: 'Icon Button Outlined',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.primary,
        ),
        borderRadius: 16,
        borderWidth: 1,
        borderColor: AppColors.primary,
      ),
    );
  }

  Widget iconButtonDark() {
    return SampleWrapper(
      title: 'Icon Button Dark',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        buttonColor: AppColors.black,
        borderRadius: 16,
      ),
    );
  }

  Widget iconButtonWithShadow() {
    return SampleWrapper(
      title: 'Icon Button With Shadow',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        buttonColor: AppColors.primary,
        borderRadius: 16,
        boxShadow: [AppShadows.primaryShadow5],
      ),
    );
  }

  Widget defaultIconButtonWithText() {
    return SampleWrapper(
      title: 'Icon Button With Text & Custom Size',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.primary,
          size: 40,
        ),
        text: 'Add',
        textStyle: AppTextStyle.bodyLarge(
          fontWeight: AppFontWeight.bold,
        ),
      ),
    );
  }
}
