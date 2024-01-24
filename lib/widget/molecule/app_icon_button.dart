import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderWidth;
  final double borderRadius;
  final double iconBorderRadius;
  final EdgeInsets padding;
  final EdgeInsets iconPadding;
  final EdgeInsets textPadding;
  final bool enable;
  final Color? buttonColor;
  final Color? iconButtonColor;
  final Color borderColor;
  final Widget icon;
  final String? text;
  final TextStyle? textStyle;
  final List<BoxShadow>? buttonBoxShadow;
  final List<BoxShadow>? iconBoxShadow;
  final List<Color>? gradient;
  final Function() onTap;

  const AppIconButton({
    super.key,
    this.width,
    this.height,
    this.borderWidth,
    this.padding = const EdgeInsets.all(AppSizes.padding / 2),
    this.iconPadding = EdgeInsets.zero,
    this.textPadding = const EdgeInsets.only(top: AppSizes.padding / 4),
    this.enable = true,
    this.buttonColor,
    this.iconButtonColor,
    this.borderColor = AppColors.blackLv7,
    this.borderRadius = AppSizes.radius,
    this.iconBorderRadius = 100,
    this.text,
    this.textStyle,
    this.gradient,
    this.buttonBoxShadow,
    this.iconBoxShadow,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1.0 : 0.5,
      child: text == null ? iconButton() : iconButtonWithText(),
    );
  }

  Widget iconButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(iconBorderRadius),
        boxShadow: iconBoxShadow ?? [],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(iconBorderRadius),
        color: Colors.transparent,
        child: InkWell(
          onTap: enable ? onTap : null,
          splashColor: Colors.black.withOpacity(0.06),
          splashFactory: InkRipple.splashFactory,
          highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(iconBorderRadius),
          child: Ink(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: iconButtonColor ?? AppColors.blueLv6,
              gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
              borderRadius: BorderRadius.circular(iconBorderRadius),
              border: borderWidth != null
                  ? Border.all(
                      width: borderWidth!,
                      color: borderColor,
                    )
                  : null,
            ),
            child: icon,
          ),
        ),
      ),
    );
  }

  Widget iconButtonWithText() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: buttonBoxShadow ?? [],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.transparent,
        child: InkWell(
          onTap: enable ? onTap : null,
          splashColor: Colors.black.withOpacity(0.06),
          splashFactory: InkRipple.splashFactory,
          highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Ink(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: buttonColor,
              gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
              borderRadius: BorderRadius.circular(borderRadius),
              border: borderWidth != null
                  ? Border.all(
                      width: borderWidth!,
                      color: borderColor,
                    )
                  : null,
            ),
            child: Column(
              children: [
                Ink(
                  width: width,
                  height: height,
                  padding: iconPadding,
                  decoration: BoxDecoration(
                    color: iconButtonColor,
                    boxShadow: iconBoxShadow ?? [],
                    gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
                    borderRadius: BorderRadius.circular(iconBorderRadius),
                    border: borderWidth != null
                        ? Border.all(
                            width: borderWidth!,
                            color: borderColor,
                          )
                        : null,
                  ),
                  child: icon,
                ),
                Padding(
                  padding: textPadding,
                  child: Text(
                    text!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle ?? AppTextStyle.bodySmall(fontWeight: AppFontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
