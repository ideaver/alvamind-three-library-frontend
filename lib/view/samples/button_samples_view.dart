import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import 'sample_wrapper.dart';

class ButtonSamplesView extends StatefulWidget {
  const ButtonSamplesView({super.key});

  static const routeName = '/molecule-app-button';

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
            primaryButtonLoading(),
            primaryButtonWithIcon(),
            primaryButtonOutlined(),
            unRoundedPrimaryButton(),
            unRoundedPrimaryButtonDark(),
            unRoundedPrimaryButtonDarkDisabled(),
            unRoundedPrimaryButtonWithIcon(),
            unRoundedPrimaryButtonOutlined(),
            secondaryButton(),
            secondaryUnRoundedButton(),
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
        text: 'Label',
      ),
    );
  }

  Widget primaryButtonDark() {
    return SampleWrapper(
      title: 'Primary Button Dark',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        buttonColor: AppColors.blackLv1,
      ),
    );
  }

  Widget primaryButtonDisabled() {
    return SampleWrapper(
      title: 'Primary Button Disabled',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        enable: false,
      ),
    );
  }

  Widget primaryButtonLoading() {
    return SampleWrapper(
      title: 'Primary Button Loading',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        isLoading: true,
      ),
    );
  }

  Widget primaryButtonOutlined() {
    return SampleWrapper(
      title: 'Primary Button Outlined',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
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
        text: 'Label',
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget unRoundedPrimaryButton() {
    return SampleWrapper(
      title: 'Un-rounded Primary Button',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        rounded: false,
      ),
    );
  }

  Widget unRoundedPrimaryButtonDark() {
    return SampleWrapper(
      title: 'Un-rounded Primary Button Dark',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        rounded: false,
        buttonColor: AppColors.blackLv1,
      ),
    );
  }

  Widget unRoundedPrimaryButtonDarkDisabled() {
    return SampleWrapper(
      title: 'Un-rounded Primary Button Disabled',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        rounded: false,
        enable: false,
      ),
    );
  }

  Widget unRoundedPrimaryButtonWithIcon() {
    return SampleWrapper(
      title: 'Un-rounded Primary Button With Icons',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        rounded: false,
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget unRoundedPrimaryButtonOutlined() {
    return SampleWrapper(
      title: 'Un-rounded Primary Button Outlined',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        rounded: false,
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
        text: 'Label',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv6,
      ),
    );
  }

  Widget secondaryUnRoundedButton() {
    return SampleWrapper(
      title: 'Secondary Un-rounded Button',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv6,
        rounded: false,
      ),
    );
  }

  Widget secondaryButtonWithIcon() {
    return SampleWrapper(
      title: 'Secondary Button With Icons',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv6,
        leftIcon: Icons.trolley,
        rightIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }
}
