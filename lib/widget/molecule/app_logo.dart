import '../../app/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';
import '../atom/app_image.dart';

enum AppLogoAlignment {
  horizontal,
  vertical,
}

class AppLogo extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String image;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final ImgProvider imgProvider;
  final double width;
  final double height;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final bool withText;
  final bool isFromAppAssets;
  final String appAssetsPackageName;
  final AppLogoAlignment alignment;
  final Function()? onTap;

  const AppLogo({
    super.key,
    this.width = 52,
    this.height = 52,
    this.titleFontSize,
    this.subtitleFontSize,
    this.titleStyle,
    this.subtitleStyle,
    this.imgProvider = ImgProvider.assetImage,
    this.withText = false,
    this.onTap,
    required this.title,
    this.subtitle,
    required this.image,
    this.alignment = AppLogoAlignment.horizontal,
    // If want to load asset from origin app or other
    // set [isFromAppAssets] to false or set [appAssetsPackageName] to destination package name
    this.isFromAppAssets = true,
    this.appAssetsPackageName = 'alvamind_three_library_frontend',
  });

  @override
  Widget build(BuildContext context) {
    return alignment == AppLogoAlignment.horizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(
                image: image,
                imgProvider: imgProvider,
                width: width,
                height: height,
                isFromAppAssets: isFromAppAssets,
                appAssetsPackageName: appAssetsPackageName,
              ),
              withText
                  ? Padding(
                      padding: EdgeInsets.only(left: width / 4),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: titleStyle ?? AppTextStyle.bold(size: titleFontSize ?? height / 1.2),
                          ),
                          subtitle != null
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    subtitle ?? '',
                                    style: subtitleStyle ?? AppTextStyle.bold(size: subtitleFontSize ?? height / 1.2),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppImage(
                image: image,
                imgProvider: imgProvider,
                width: width,
                height: height,
                isFromAppAssets: isFromAppAssets,
                appAssetsPackageName: appAssetsPackageName,
                fit: BoxFit.contain,
              ),
              withText
                  ? Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: height / 4),
                          child: Text(
                            title,
                            style: titleStyle ?? AppTextStyle.bold(size: titleFontSize ?? height / 2),
                          ),
                        ),
                        subtitle != null
                            ? Padding(
                                padding: EdgeInsets.only(top: height / 6),
                                child: Text(
                                  subtitle ?? '',
                                  style: subtitleStyle ??
                                      AppTextStyle.semiBold(
                                        size: subtitleFontSize ?? height / 5,
                                        color: AppColors.blackLv6,
                                      ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          );
  }
}
