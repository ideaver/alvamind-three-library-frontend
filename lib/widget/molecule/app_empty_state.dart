import 'package:alvamind_three_library_frontend/app/asset/app_assets.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_image.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:flutter/widgets.dart';

class AppEmptyState extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? backButtonText;
  final dynamic Function()? onTapBackButton;
  final Future<void> Function()? onTapRefreshButton;
  final String? refreshButtonText;
  final String? imgPath;

  const AppEmptyState({
    super.key,
    required this.title,
    this.subtitle,
    this.backButtonText = "Kembali",
    this.onTapBackButton,
    this.onTapRefreshButton,
    this.refreshButtonText = "Refresh",
    this.imgPath = AppAssets.nodataLight,
  });

  @override
  State<AppEmptyState> createState() => _AppEmptyStateState();
}

class _AppEmptyStateState extends State<AppEmptyState> {
  bool isRefreshing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.padding * 2),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              image: widget.imgPath!,
              imgProvider: ImgProvider.assetImage,
              width: 120,
              height: 120,
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: AppTextStyle.heading4(),
            ),
            if (widget.subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.padding),
                child: Text(
                  widget.subtitle ?? '',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.blackLv5,
                  ),
                ),
              ),
            if (widget.onTapRefreshButton != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.padding),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 100),
                  child: LayoutBuilder(builder: (context, constraint) {
                    return AppButton(
                      // center: false,
                      width: constraint.minWidth,
                      onTap: () async {
                        isRefreshing = true;
                        setState(() {});

                        await widget.onTapRefreshButton!();

                        isRefreshing = false;
                        setState(() {});
                      },
                      text: widget.refreshButtonText,
                      fontSize: 14,
                      padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                      isLoading: isRefreshing,
                      loadingIndicatorSize: 19,
                    );
                  }),
                ),
              ),
            if (widget.onTapBackButton != null)
              Padding(
                padding: const EdgeInsets.only(top: AppSizes.padding),
                child: AppButton(
                  center: false,
                  onTap: widget.onTapBackButton!,
                  text: widget.backButtonText,
                  fontSize: 14,
                  padding: const EdgeInsets.all(AppSizes.padding / 1.5),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
