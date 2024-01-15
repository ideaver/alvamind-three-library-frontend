import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import 'app_icon_button.dart';

class AppSnackbar {
  static Future<void> show(
    NavigatorState navigator, {
    IconData? icon,
    Color? backgroundColor,
    Color? textColor,
    Color? iconColor,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? borderRadius,
    double? iconSize,
    required String title,
    TextStyle? titleStyle,
    String? subtitle,
    TextStyle? subtitleStyle,
    bool? showCloseButton,
    Duration? displayDuration,
  }) async {
    final messenger = ScaffoldMessenger.of(navigator.context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        backgroundColor: AppColors.transparent,
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        padding: EdgeInsets.zero,
        margin: margin ?? EdgeInsets.all(AppSizes.padding),
        duration: displayDuration ?? const Duration(seconds: 5),
        content: AppSnackbarWidget(
          messenger: messenger,
          icon: icon,
          backgroundColor: backgroundColor ?? AppColors.primary,
          textColor: textColor ?? AppColors.white,
          iconColor: iconColor ?? AppColors.white,
          padding: padding ?? const EdgeInsets.all(14),
          borderRadius: borderRadius ?? 8,
          iconSize: iconSize ?? 16,
          title: title,
          subtitle: subtitle,
          titleStyle: titleStyle,
          subtitleStyle: subtitleStyle,
          showCloseButton: showCloseButton ?? false,
        ),
      ),
    );
  }
}

class AppSnackbarWidget extends StatelessWidget {
  final ScaffoldMessengerState messenger;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double iconSize;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool? showCloseButton;

  const AppSnackbarWidget({
    super.key,
    required this.messenger,
    this.icon,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.iconColor = AppColors.white,
    this.padding = const EdgeInsets.all(14),
    this.borderRadius = 8,
    this.iconSize = 16,
    required this.title,
    this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [AppShadows.cardShadow2],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: padding.horizontal / 3),
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ??
                        AppTextStyle.bodyMedium(
                          fontWeight: AppFontWeight.bold,
                          color: textColor,
                        ),
                  ),
                  subtitle != null
                      ? Text(
                          subtitle!,
                          style: subtitleStyle ??
                              AppTextStyle.bodySmall(
                                fontWeight: AppFontWeight.medium,
                                color: textColor,
                              ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
          showCloseButton == true
              ? AppIconButton(
                  padding: EdgeInsets.zero,
                  buttonColor: AppColors.transparent,
                  icon: Icon(
                    Icons.close_rounded,
                    size: iconSize,
                    color: iconColor,
                  ),
                  onTap: () {
                    messenger.hideCurrentSnackBar();
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
