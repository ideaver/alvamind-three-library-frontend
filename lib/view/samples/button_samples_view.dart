import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import 'sample_wrapper.dart';

class ButtonSamplesView extends StatefulWidget {
  const ButtonSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-button-samples';

  @override
  State<ButtonSamplesView> createState() => _ButtonSamplesViewState();
}

class _ButtonSamplesViewState extends State<ButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Button Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            primaryButton(),
            primaryButtonDark(),
            primaryButtonDisabled(),
            primaryButtonWithIcon(),
            primaryButtonOutlined(),
            roundedPrimaryButton(),
            roundedPrimaryButtonDark(),
            roundedPrimaryButtonDarkDisabled(),
            roundedPrimaryButtonWithIcon(),
            roundedPrimaryButtonOutlined(),
            secondaryButton(),
            secondaryRoundedButton(),
            secondaryButtonWithIcon(),
          ],
        ),
      ),
    );
  }

  Widget primaryButton() {
    return SampleWrapper(
      title: 'Primary Button',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
      ),
    );
  }

  Widget primaryButtonDark() {
    return SampleWrapper(
      title: 'Primary Button Dark',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        buttonColor: AppColors.blackLv1,
      ),
    );
  }

  Widget primaryButtonDisabled() {
    return SampleWrapper(
      title: 'Primary Button Disabled',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        enable: false,
      ),
    );
  }

  Widget primaryButtonOutlined() {
    return SampleWrapper(
      title: 'Primary Button Outlined',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        buttonColor: AppColors.white,
        textColor: AppColors.blackLv1,
        leftIcon: Icons.apple,
        borderWidth: 1,
      ),
    );
  }

  Widget primaryButtonWithIcon() {
    return SampleWrapper(
      title: 'Primary Button With Icons',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget roundedPrimaryButton() {
    return SampleWrapper(
      title: 'Rounded Primary Button',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        rounded: true,
      ),
    );
  }

  Widget roundedPrimaryButtonDark() {
    return SampleWrapper(
      title: 'Rounded Primary Button Dark',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        rounded: true,
        buttonColor: AppColors.blackLv1,
      ),
    );
  }

  Widget roundedPrimaryButtonDarkDisabled() {
    return SampleWrapper(
      title: 'Rounded Primary Button Disabled',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        rounded: true,
        enable: false,
      ),
    );
  }

  Widget roundedPrimaryButtonWithIcon() {
    return SampleWrapper(
      title: 'Rounded Primary Button With Icons',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        rounded: true,
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget roundedPrimaryButtonOutlined() {
    return SampleWrapper(
      title: 'Rounded Primary Button Outlined',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        rounded: true,
        buttonColor: AppColors.white,
        textColor: AppColors.blackLv1,
        leftIcon: Icons.apple,
        borderWidth: 1,
      ),
    );
  }

  Widget secondaryButton() {
    return SampleWrapper(
      title: 'Secondary Button',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv5,
      ),
    );
  }

  Widget secondaryRoundedButton() {
    return SampleWrapper(
      title: 'Secondary Rounded Button',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv5,
        rounded: true,
      ),
    );
  }

  Widget secondaryButtonWithIcon() {
    return SampleWrapper(
      title: 'Secondary Button With Icons',
      widget: AppButton(
        onTap: () {},
        text: 'AppButton()',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv5,
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
