import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppTextButton extends StatelessWidget {
  final double? fontSize;
  final EdgeInsets? padding;
  final bool enable;
  final Color disabledTextColor;
  final Color textColor;
  final TextStyle? textStyle;
  final String text;
  final double borderRadius;
  final Function() onTap;

  const AppTextButton({
    super.key,
    this.fontSize,
    this.padding,
    this.enable = true,
    this.disabledTextColor = AppColors.blackLv4,
    this.textColor = AppColors.blueLv1,
    this.textStyle,
    this.borderRadius = AppSizes.radius,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enable ? onTap : null,
      borderRadius: BorderRadius.circular(borderRadius),
      splashColor: padding == null ? AppColors.transparent : null,
      highlightColor: padding == null ? AppColors.transparent : null,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: buttonText(),
      ),
    );
  }

  Widget buttonText() {
    return Text(
      text,
      style: AppTextStyle.bold(
        size: fontSize ?? 14,
        color: enable ? textColor : disabledTextColor,
      ),
    );
  }
}
