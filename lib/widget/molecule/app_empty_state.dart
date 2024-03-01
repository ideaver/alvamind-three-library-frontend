import 'package:alvamind_three_library_frontend/app/asset/app_assets.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_image.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:flutter/widgets.dart';

class AppEmptyState extends StatelessWidget {
  final bool? showRefreshButton;
  final String title;
  final String subtitle;
  final String? backButtonText;
  final dynamic Function() onBackButtonTap;
  final dynamic Function()? onRefreshButtonTap;
  final String? refreshButtonText;
  final String? imgPath;

  const AppEmptyState({
    super.key,
    this.showRefreshButton = false,
    required this.title,
    required this.subtitle,
    this.backButtonText = "Kembali",
    required this.onBackButtonTap,
    this.onRefreshButtonTap,
    this.refreshButtonText = "Refresh",
    this.imgPath = AppAssets.nodataLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              image: imgPath!,
              imgProvider: ImgProvider.assetImage,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: AppSizes.padding,
            ),
            Text(
              title,
              style: AppTextStyle.heading4(),
            ),
            const SizedBox(
              height: AppSizes.padding / 4,
            ),
            Text(
              subtitle,
              style: AppTextStyle.bodyMedium(
                fontWeight: AppFontWeight.regular,
                color: AppColors.blackLv5,
              ),
            ),
            if (showRefreshButton!)
              Column(
                children: [
                  const SizedBox(
                    height: AppSizes.padding,
                  ),
                  AppButton(
                    width: 240,
                    buttonColor: AppColors.secondary,
                    onTap: onRefreshButtonTap!,
                    text: refreshButtonText,
                  ),
                ],
              ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            AppButton(
              width: 240,
              onTap: onBackButtonTap,
              text: backButtonText,
            ),
          ],
        ),
      ),
    );
  }
}
