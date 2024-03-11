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
  final String? subtitle;
  final String? backButtonText;
  final dynamic Function()? onBackButtonTap;
  final dynamic Function()? onRefreshButtonTap;
  final String? refreshButtonText;
  final String? imgPath;

  const AppEmptyState({
    super.key,
    this.showRefreshButton = false,
    required this.title,
    this.subtitle,
    this.backButtonText = "Kembali",
    this.onBackButtonTap,
    this.onRefreshButtonTap,
    this.refreshButtonText = "Refresh",
    this.imgPath = AppAssets.nodataLight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding * 2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              image: imgPath!,
              imgProvider: ImgProvider.assetImage,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.heading4(),
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSizes.padding),
                child: Text(
                  subtitle ?? '',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.blackLv5,
                  ),
                ),
              ),
            if (showRefreshButton!)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.padding),
                child: AppButton(
                  width: 240,
                  onTap: onRefreshButtonTap!,
                  text: refreshButtonText,
                ),
              ),
            if (onBackButtonTap != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.padding),
                child: AppButton(
                  width: 240,
                  onTap: onBackButtonTap!,
                  text: backButtonText,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
