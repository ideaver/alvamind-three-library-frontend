import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppIconButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final bool enable;
  final Color? buttonColor;
  final Color borderColor;
  final Widget icon;
  final String? text;
  final EdgeInsetsGeometry? paddingText;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShadow;
  final List<Color>? gradient;
  final Function() onTap;

  const AppIconButton({
    super.key,
    this.width,
    this.height,
    this.borderWidth,
    this.padding = const EdgeInsets.all(12),
    this.enable = true,
    this.buttonColor = AppColors.blueLv6,
    this.borderColor = AppColors.transparent,
    this.borderRadius = 100,
    this.text,
    this.textStyle,
    this.paddingText,
    this.gradient,
    this.boxShadow,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1.0 : 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          text == null ? iconButton() : iconButtonWithText(),
        ],
      ),
    );
  }

  Widget iconButton() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: boxShadow ?? [],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4),
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
              boxShadow: boxShadow ?? [],
              gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
              borderRadius: BorderRadius.circular(borderRadius),
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
        boxShadow: boxShadow ?? [],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: Colors.transparent,
        child: InkWell(
          onTap: enable ? onTap : null,
          splashColor: Colors.black.withOpacity(0.06),
          splashFactory: InkRipple.splashFactory,
          highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
          // borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: buttonColor,
              boxShadow: boxShadow ?? [],
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
                Container(
                  width: width,
                  height: height,
                  padding: padding,
                  decoration: BoxDecoration(
                    color: buttonColor,
                    boxShadow: boxShadow ?? [],
                    gradient: gradient != null ? LinearGradient(colors: gradient!) : null,
                    borderRadius: BorderRadius.circular(borderRadius),
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
                  padding: paddingText ?? const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
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
