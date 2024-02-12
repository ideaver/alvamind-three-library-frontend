import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_appbar.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_field_container.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AppFieldContainerSamplesView extends StatefulWidget {
  const AppFieldContainerSamplesView({super.key});
  static const routeName = '/molecule-app-field-container';

  @override
  State<AppFieldContainerSamplesView> createState() =>
      _AppFieldContainerSamplesViewState();
}

class _AppFieldContainerSamplesViewState
    extends State<AppFieldContainerSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppbar(
        title: 'Field Container Samples',
      ),
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dotted Border Field Container',
                style: AppTextStyle.heading6(),
              ),
              const SizedBox(
                height: AppSizes.padding / 2,
              ),
              cuponCard(),
              const SizedBox(
                height: AppSizes.padding,
              ),
              Text(
                'Link Field Container ',
                style: AppTextStyle.heading6(),
              ),
              const SizedBox(
                height: AppSizes.padding / 2,
              ),
              linkCard(),
              const SizedBox(
                height: AppSizes.padding,
              ),
              Text(
                'Custom Field Container ',
                style: AppTextStyle.heading6(),
              ),
              const SizedBox(
                height: AppSizes.padding / 2,
              ),
              customCard(),
              const SizedBox(
                height: AppSizes.padding,
              ),
              Text(
                'Custom Dotted Border Field Container ',
                style: AppTextStyle.heading6(),
              ),
              const SizedBox(
                height: AppSizes.padding / 2,
              ),
              customDottedBorderCard(),
            ],
          ),
        ),
      ),
    );
  }

  cuponCard() {
    return AppFieldContainer(
      dottedColor: AppColors.blackLv5,
      isDottedBorder: true,
      onTap: () {},
      leading: AppIconButton(
        iconButtonColor: AppColors.blueLv1,
        icon: const Icon(
          AppIcons.mdi_voucher_outline,
          color: AppColors.white,
        ),
        onTap: () {},
      ),
      title: 'EKSPORYUKXJEROME',
      subtitle: 'Kupon Utama: EKSPORYUK',
    );
  }

  linkCard() {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: AppFieldContainer(
        onTap: () {},
        leading: AppIconButton(
          iconButtonColor: AppColors.blueLv1,
          icon: const Icon(
            AppIcons.link,
            color: AppColors.white,
          ),
          onTap: () {},
        ),
        title: 'eksporyuk-bimbingan.com',
        subtitle: 'Kelas Bimbingan Ekspor Yuk',
      ),
    );
  }

  customCard() {
    return AppFieldContainer(
      onTap: () {},
      leading: AppIconButton(
        iconButtonColor: AppColors.blueLv1,
        icon: const Icon(
          AppIcons.mdi_voucher_outline,
          color: AppColors.white,
        ),
        onTap: () {},
      ),
      title: 'Your Title',
      subtitle: 'Your Subtitle',
      trailing: Container(),
    );
  }

  customDottedBorderCard() {
    return AppFieldContainer(
      isDottedBorder: true,
      dottedColor: AppColors.blackLv5,
      dottedBorderRadius: 50,
      dottedBorderType: BorderType.RRect,
      onTap: () {},
      leading: AppIconButton(
        iconButtonColor: AppColors.blueLv1,
        icon: const Icon(
          AppIcons.mdi_voucher_outline,
          color: AppColors.white,
        ),
        onTap: () {},
      ),
      title: 'Your Title',
      subtitle: 'Your Subtitle',
      trailing: Container(),
    );
  }
}
