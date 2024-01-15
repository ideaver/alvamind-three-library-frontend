import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_icon_button.dart';
import 'sample_wrapper.dart';

class IconButtonSamplesView extends StatefulWidget {
  const IconButtonSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-icon-button-samples';

  @override
  State<IconButtonSamplesView> createState() => _IconButtonSamplesViewState();
}

class _IconButtonSamplesViewState extends State<IconButtonSamplesView> {
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
            iconButtonLight(),
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
          color: AppColors.white,
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
          color: AppColors.black,
        ),
        buttonColor: AppColors.white,
        borderRadius: 16,
        borderWidth: 1,
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

  Widget iconButtonLight() {
    return SampleWrapper(
      title: 'Icon Button Light',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
        borderRadius: 16,
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
          color: AppColors.white,
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
