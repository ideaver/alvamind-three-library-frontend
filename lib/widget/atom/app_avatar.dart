import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import 'app_image.dart';

class AppAvatar extends StatelessWidget {
  final String image;
  final ImgProvider imgProvider;
  final double size;
  final double? borderWidth;
  final double borderRadius;
  final double? iconSize;
  final bool showIconButton;
  final bool enabled;
  final bool enableFullScreenView;
  final Color? backgroundColor;
  final Color enabledColor;
  final Color disabledColor;
  final Color iconColor;
  final IconData? icon;
  final Function()? onTapIconButton;

  const AppAvatar({
    super.key,
    required this.image,
    this.imgProvider = ImgProvider.networkImage,
    this.size = 60,
    this.borderWidth,
    this.borderRadius = 100,
    this.iconSize,
    this.showIconButton = false,
    this.enabled = true,
    this.enableFullScreenView = true,
    this.backgroundColor = AppColors.blackLv9,
    this.enabledColor = AppColors.primary,
    this.disabledColor = AppColors.disabled,
    this.iconColor = AppColors.white,
    this.icon,
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
          borderWidth: borderWidth,
          borderRadius: borderRadius,
          enableFullScreenView: enabled ? enableFullScreenView : false,
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
                      borderRadius: icon == null ? null : BorderRadius.circular(size / 10),
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
