import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
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
            defaultIconButtonDisabled(),
            defaulIconButtonOutlined(),
            iconButtonDark(),
            iconButtonWithShadow(),
            iconButtonWithText(),
            customIconButton(),
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

  Widget defaultIconButtonDisabled() {
    return SampleWrapper(
      title: 'Default Icon Button Disabled',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.primary,
        ),
        enable: false,
      ),
    );
  }

  Widget defaulIconButtonOutlined() {
    return SampleWrapper(
      title: 'Default Icon Button Outlined',
      widget: AppIconButton(
        onTap: () {},
        icon: const Icon(
          Icons.add,
          color: AppColors.black,
        ),
        borderWidth: 1,
        iconButtonColor: AppColors.transparent,
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
        iconButtonColor: AppColors.black,
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
        iconButtonColor: AppColors.primary,
        iconBoxShadow: [AppShadows.primaryShadow5],
      ),
    );
  }

  Widget iconButtonWithText() {
    return SampleWrapper(
      title: 'Icon Button With Text',
      widget: Column(
        children: [
          Wrap(
            runSpacing: AppSizes.padding / 2,
            spacing: AppSizes.padding / 2,
            children: [
              AppIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: AppColors.blackLv4,
                  size: 32,
                ),
                text: 'Beranda',
                textStyle: AppTextStyle.bold(size: 12, color: AppColors.blackLv4),
              ),
              AppIconButton(
                onTap: () {},
                icon: Icon(
                  Icons.home_outlined,
                  color: AppColors.primary,
                  size: 32,
                  shadows: [AppShadows.primaryShadow6],
                ),
                text: 'Beranda',
                textStyle: AppTextStyle.bold(size: 12, color: AppColors.primary),
              ),
              AppIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.history,
                  color: AppColors.primary,
                  size: 32,
                ),
                text: 'Top Up',
                textStyle: AppTextStyle.bold(size: 12),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.padding / 2),
          Wrap(
            runSpacing: AppSizes.padding / 2,
            spacing: AppSizes.padding / 2,
            children: [
              AppIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.history,
                  color: AppColors.primary,
                  size: 32,
                ),
                text: 'Top Up',
                textStyle: AppTextStyle.bold(size: 12),
                iconButtonColor: AppColors.blueLv6,
                iconPadding: const EdgeInsets.all(AppSizes.padding / 2),
              ),
              AppIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.history,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'Top Up',
                textStyle: AppTextStyle.bold(size: 12),
                iconButtonColor: AppColors.primary,
                iconPadding: const EdgeInsets.all(AppSizes.padding / 2),
                iconBoxShadow: [AppShadows.primaryShadow5],
              ),
              AppIconButton(
                onTap: () {},
                icon: const Icon(
                  Icons.history,
                  color: AppColors.white,
                  size: 32,
                ),
                text: 'Top Up',
                textStyle: AppTextStyle.bold(size: 12),
                iconButtonColor: AppColors.primary,
                iconPadding: const EdgeInsets.all(AppSizes.padding / 2),
                iconBoxShadow: [AppShadows.primaryShadow5],
                iconBorderRadius: AppSizes.radius * 2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customIconButton() {
    return SampleWrapper(
      title: 'Custom Icon Button With Text',
      widget: Wrap(
        runSpacing: AppSizes.padding / 2,
        spacing: AppSizes.padding / 2,
        children: [
          AppIconButton(
            onTap: () {},
            icon: const Icon(
              Icons.history,
              color: AppColors.black,
              size: 32,
            ),
            text: 'Top Up',
            textStyle: AppTextStyle.bold(size: 12),
            buttonColor: AppColors.blackLv9,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding * 2),
            borderRadius: AppSizes.radius * 2,
          ),
          AppIconButton(
            onTap: () {},
            icon: const Icon(
              Icons.history,
              color: AppColors.white,
              size: 32,
            ),
            text: 'Top Up',
            textStyle: AppTextStyle.bold(size: 12),
            buttonColor: AppColors.white,
            padding: const EdgeInsets.symmetric(vertical: AppSizes.padding, horizontal: AppSizes.padding * 2),
            buttonBoxShadow: [AppShadows.darkShadow1],
            borderRadius: AppSizes.radius * 2,
            iconButtonColor: AppColors.primary,
            iconPadding: const EdgeInsets.all(AppSizes.padding / 2),
          ),
        ],
      ),
    );
  }
}
