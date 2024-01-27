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
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final Function()? onTap;

  const AppTags({
    super.key,
    this.fontSize = 10,
    this.borderWidth,
    this.borderRadius = 100,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    this.color = AppColors.primary,
    this.textColor = AppColors.white,
    this.iconsColor = AppColors.white,
    this.borderColor = AppColors.primary,
    required this.text,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconWidget,
    this.suffixIconWidget,
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
              prefixWidget(),
              textWidget(),
              suffixWidget(),
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

  Widget prefixWidget() {
    if (prefixIcon == null && prefixIconWidget == null) {
      return const SizedBox.shrink();
    }

    if (prefixIconWidget != null) {
      return prefixIconWidget!;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: Icon(
        prefixIcon,
        color: iconsColor,
        size: fontSize + 2,
      ),
    );
  }

  Widget suffixWidget() {
    if (suffixIcon == null && suffixIconWidget == null) {
      return const SizedBox.shrink();
    }

    if (suffixIconWidget != null) {
      return suffixIconWidget!;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Icon(
        suffixIcon,
        color: iconsColor,
        size: fontSize + 2,
      ),
    );
  }
}
