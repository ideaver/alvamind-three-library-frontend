import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/app/utility/currency_formatter.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import '___sample_wrapper.dart';

class AppButtonSamplesView extends StatefulWidget {
  const AppButtonSamplesView({super.key});

  static const routeName = '/molecule-app-button';

  @override
  State<AppButtonSamplesView> createState() => _AppButtonSamplesViewState();
}

class _AppButtonSamplesViewState extends State<AppButtonSamplesView> {
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
            minWidthButton(),
            customButtons(),
            customButtonsWithVerticalAlignment(),
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
        prefixIcon: Icons.apple,
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
        prefixIcon: Icons.trolley,
        suffixIcon: Icons.arrow_forward_ios_rounded,
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
        prefixIcon: Icons.trolley,
        suffixIcon: Icons.arrow_forward_ios_rounded,
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
        prefixIcon: Icons.apple,
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
        prefixIcon: Icons.trolley,
        suffixIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget minWidthButton() {
    return SampleWrapper(
      title: 'Minimum Button Width',
      widget: AppButton(
        onTap: () {},
        text: 'Label',
        // Make button shrinked
        center: false,
        textColor: AppColors.primary,
        buttonColor: AppColors.blueLv6,
        prefixIcon: Icons.trolley,
        suffixIcon: Icons.arrow_forward_ios_rounded,
      ),
    );
  }

  Widget customButtons() {
    return SampleWrapper(
      title: 'Custom Buttons',
      widget: Wrap(
        runSpacing: AppSizes.padding / 2,
        spacing: AppSizes.padding / 2,
        children: [
          AppButton(
            onTap: () {},
            text: 'Label',
            center: false,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            prefixIcon: AppIcons.heart,
            prefixIconColor: AppColors.redLv2,
          ),
          AppButton(
            onTap: () {},
            text: 'Label',
            center: false,
            buttonColor: AppColors.blueLv6,
            textColor: AppColors.black,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            prefixIcon: AppIcons.heart,
            prefixIconColor: AppColors.redLv2,
          ),
          AppButton(
            onTap: () {},
            text: 'Label',
            center: false,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            prefixIconWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2, vertical: AppSizes.padding / 4),
              decoration: BoxDecoration(
                color: AppColors.blueLv6,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                AppIcons.basil_document_outline_1,
                color: AppColors.primary,
                size: 14,
              ),
            ),
          ),
          AppButton(
            onTap: () {},
            text: 'Label',
            center: false,
            buttonColor: AppColors.white,
            textColor: AppColors.black,
            borderWidth: 1,
            borderColor: AppColors.blueLv6,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            prefixIconWidget: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2, vertical: AppSizes.padding / 4),
              decoration: BoxDecoration(
                color: AppColors.blueLv6,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(
                AppIcons.basil_document_outline_1,
                color: AppColors.primary,
                size: 14,
              ),
            ),
          ),
          AppButton(
            onTap: () {},
            text: 'Facebook',
            center: false,
            buttonColor: AppColors.white,
            textColor: AppColors.black,
            borderWidth: 1,
            borderColor: AppColors.blueLv6,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 2, horizontal: AppSizes.padding),
            fontSize: 14,
            fontWeight: AppFontWeight.medium,
            prefixIcon: AppIcons.facebook_logo,
            prefixIconColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget customButtonsWithVerticalAlignment() {
    return SampleWrapper(
      title: 'Custom Buttons With Vertical Alignment',
      widget: Row(
        children: [
          Expanded(
            child: AppButton(
              onTap: () {},
              text: CurrencyFormatter.format(10000),
              center: false,
              rounded: false,
              alignment: AppButtonAlignment.vertical,
              borderRadius: 10,
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
              fontSize: 14,
              fontWeight: AppFontWeight.medium,
              textPadding: const EdgeInsets.only(top: AppSizes.padding / 2),
              prefixIconWidget: Container(
                padding: const EdgeInsets.all(AppSizes.padding / 2),
                decoration: BoxDecoration(
                  color: AppColors.blueLv6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.monetization_on_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.padding / 2),
          Expanded(
            child: AppButton(
              onTap: () {},
              text: CurrencyFormatter.format(10000),
              center: false,
              rounded: false,
              alignment: AppButtonAlignment.vertical,
              borderRadius: 10,
              buttonColor: AppColors.white,
              textColor: AppColors.black,
              borderWidth: 1,
              borderColor: AppColors.blueLv6,
              padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
              fontSize: 14,
              fontWeight: AppFontWeight.medium,
              textPadding: const EdgeInsets.only(top: AppSizes.padding / 2),
              prefixIconWidget: Container(
                padding: const EdgeInsets.all(AppSizes.padding / 2),
                decoration: BoxDecoration(
                  color: AppColors.blueLv6,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.monetization_on_outlined,
                  color: AppColors.primary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
