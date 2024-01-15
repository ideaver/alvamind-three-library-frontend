import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_text_style.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderWidth;
  final double? iconPadding;
  final double borderRadius;
  final EdgeInsets padding;
  final bool enable;
  final bool rounded;
  final bool showBoxShadow;
  final List<BoxShadow>? boxShadow;
  final Color buttonColor;
  final Color disabledButtonColor;
  final Color disabledTextColor;
  final Color textColor;
  final Color borderColor;
  final String text;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Widget? customText;
  final Function() onTap;

  const AppButton({
    super.key,
    this.width,
    this.height,
    this.fontSize,
    this.borderWidth,
    this.iconPadding,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    this.enable = true,
    this.rounded = false,
    this.showBoxShadow = false,
    this.boxShadow,
    this.buttonColor = AppColors.primary,
    this.disabledButtonColor = AppColors.disabled,
    this.disabledTextColor = AppColors.white,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.blackLv7,
    this.leftIcon,
    this.rightIcon,
    this.customText,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
      child: InkWell(
        onTap: enable ? onTap : null,
        splashColor: AppColors.black.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
        child: Ink(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            color: enable ? buttonColor : disabledButtonColor,
            borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
            border: borderWidth != null
                ? Border.all(
                    width: borderWidth!,
                    color: borderColor,
                  )
                : null,
            boxShadow: showBoxShadow && enable ? boxShadow ?? [AppShadows.shadow1] : null,
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                leftIconWidget(),
                buttonText(),
                rightIconWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonText() {
    return customText == null
        ? Text(
            text,
            style: AppTextStyle.bold(
              size: fontSize ?? 16,
              color: enable ? textColor : disabledTextColor,
            ),
          )
        : customText!;
  }

  Widget leftIconWidget() {
    if (leftIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(right: iconPadding ?? 12),
      child: Icon(
        leftIcon,
        color: enable ? textColor : disabledTextColor,
        size: (fontSize ?? 16) + 2,
      ),
    );
  }

  Widget rightIconWidget() {
    if (rightIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(left: iconPadding ?? 12),
      child: Icon(
        rightIcon,
        color: enable ? textColor : disabledTextColor,
        size: (fontSize ?? 16) + 2,
      ),
    );
  }
}
