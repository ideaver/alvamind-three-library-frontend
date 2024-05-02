import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import 'app_image.dart';

class AppAvatar extends StatelessWidget {
  final String image;
  final ImgProvider imgProvider;
  final double size;
  final double? borderWidth;
  final double borderRadius;
  final double? iconButtonBorderRadius;
  final double? iconSize;
  final bool showIconButton;
  final bool enabled;
  final bool enableFullScreenView;
  final Color? backgroundColor;
  final Color enabledColor;
  final Color disabledColor;
  final Color iconColor;
  final IconData? icon;
  final bool isFromAppAssets;
  final String appAssetsPackageName;
  final Function()? onTapIconButton;

  const AppAvatar({
    super.key,
    required this.image,
    this.imgProvider = ImgProvider.networkImage,
    this.size = 60,
    this.borderWidth,
    this.borderRadius = 100,
    this.iconButtonBorderRadius,
    this.iconSize,
    this.showIconButton = false,
    this.enabled = true,
    this.enableFullScreenView = true,
    this.backgroundColor = AppColors.blackLv9,
    this.enabledColor = AppColors.primary,
    this.disabledColor = AppColors.disabled,
    this.iconColor = AppColors.white,
    this.icon,
    // If want to load asset from origin app or other
    // set [isFromAppAssets] to false or set [appAssetsPackageName] to destination package name
    this.isFromAppAssets = true,
    this.appAssetsPackageName = AppAssets.appAssetsPackageName,
    this.onTapIconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppImage(
          image: image,
          imgProvider: imgProvider,
          width: size,
          height: size,
          backgroundColor: backgroundColor,
          borderColor: enabled ? enabledColor : disabledColor,
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          enableFullScreenView: enabled ? enableFullScreenView : false,
          isFromAppAssets: isFromAppAssets,
          appAssetsPackageName: appAssetsPackageName,
          errorWidget: Icon(
            Icons.person,
            size: size / 2,
            color: AppColors.blackLv5,
          ),
        ),
        showIconButton
            ? Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: enabled ? onTapIconButton : null,
                  child: Container(
                    padding: EdgeInsets.all(size / 20),
                    decoration: BoxDecoration(
                      color: enabled ? enabledColor : disabledColor,
                      shape: icon == null ? BoxShape.circle : BoxShape.rectangle,
                      border: Border.all(
                        width: size / 18,
                        color: AppColors.white,
                      ),
                      boxShadow: [AppShadows.darkShadow5],
                      borderRadius: icon == null ? null : BorderRadius.circular(iconButtonBorderRadius ?? (size / 10)),
                    ),
                    child: icon != null
                        ? Icon(
                            icon,
                            color: iconColor,
                            size: iconSize ?? (size / 8),
                          )
                        : SizedBox(
                            width: size / 8,
                            height: size / 8,
                          ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
