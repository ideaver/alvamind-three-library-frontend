import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppTags extends StatelessWidget {
  final double fontSize;
  final double? borderWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final Color color;
  final Color textColor;
  final Color iconsColor;
  final Color borderColor;
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function()? onTap;

  const AppTags({
    super.key,
    this.fontSize = 10,
    this.borderWidth,
    this.borderRadius = 6,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.iconsColor = AppColors.white,
    this.borderColor = AppColors.primary,
    required this.text,
    this.leftIcon,
    this.rightIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        onTap: onTap,
        splashColor: AppColors.black.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        highlightColor: AppColors.black.withOpacity(0.12),
        borderRadius: BorderRadius.circular(borderRadius),
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: borderWidth != null
                ? Border.all(
                    width: borderWidth!,
                    color: borderColor,
                  )
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              leftIconWidget(),
              textWidget(),
              rightIconWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget textWidget() {
    return Text(
      text,
      style: AppTextStyle.bold(
        size: fontSize,
        color: textColor,
      ),
    );
  }

  Widget leftIconWidget() {
    if (leftIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Icon(
        leftIcon,
        color: iconsColor,
        size: fontSize + 2,
      ),
    );
  }

  Widget rightIconWidget() {
    if (rightIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Icon(
        rightIcon,
        color: iconsColor,
        size: fontSize + 2,
      ),
    );
  }
}
