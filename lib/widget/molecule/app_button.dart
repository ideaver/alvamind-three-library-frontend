import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

enum AppButtonAlignment {
  horizontal,
  vertical,
}

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderWidth;
  final double borderRadius;
  final double loadingIndicatorSize;
  final EdgeInsets padding;
  final EdgeInsets textPadding;
  final bool enable;
  final bool rounded;
  final bool showBoxShadow;
  final bool isLoading;
  final bool center;
  final List<BoxShadow>? boxShadow;
  final Color buttonColor;
  final Color disabledButtonColor;
  final Color disabledTextColor;
  final Color textColor;
  final Color borderColor;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Color loadingIndicatorColor;
  final String? text;
  final AppFontWeight? fontWeight;
  final String? fontFamily;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixIconWidget;
  final Widget? textWidget;
  final Widget? suffixIconWidget;
  final AppButtonAlignment alignment;
  final Function() onTap;
  final List<Color>? colorGradient;
  final bool isGradient;
  final AlignmentGeometry? begin;
  final AlignmentGeometry? end;

  const AppButton({
    super.key,
    this.width,
    this.height,
    this.fontSize,
    this.borderWidth,
    this.borderRadius = 6,
    this.loadingIndicatorSize = 22,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSizes.padding * 2, vertical: AppSizes.padding),
    this.textPadding = const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
    this.enable = true,
    this.rounded = true,
    this.showBoxShadow = false,
    this.isLoading = false,
    this.center = true,
    this.boxShadow,
    this.buttonColor = AppColors.primary,
    this.disabledButtonColor = AppColors.disabled,
    this.disabledTextColor = AppColors.white,
    this.textColor = AppColors.white,
    this.borderColor = AppColors.blackLv7,
    this.prefixIconColor,
    this.suffixIconColor,
    this.loadingIndicatorColor = AppColors.white,
    this.text,
    this.fontWeight = AppFontWeight.bold,
    this.fontFamily,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconWidget,
    this.textWidget,
    this.suffixIconWidget,
    this.alignment = AppButtonAlignment.horizontal,
    required this.onTap,
    this.isGradient = false,
    this.begin,
    this.end,
    this.colorGradient,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
      color: buttonColor,
      child: InkWell(
        onTap: enable && !isLoading ? onTap : null,
        splashColor: AppColors.black.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
        child: Ink(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
            gradient: isGradient
                ? LinearGradient(
                    colors: colorGradient ?? [AppColors.blueLv1, AppColors.darkBlueLv5],
                    begin: begin ?? Alignment.centerLeft,
                    end: end ?? Alignment.centerRight,
                  )
                : null,
            color: enable ? buttonColor : disabledButtonColor,
            borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
            border: borderWidth != null
                ? Border.all(
                    width: borderWidth!,
                    color: borderColor,
                  )
                : null,
            boxShadow: showBoxShadow && enable ? boxShadow ?? [AppShadows.darkShadow1] : null,
          ),
          child: center ? Center(child: child()) : child(),
        ),
      ),
    );
  }

  Widget child() {
    return isLoading
        ? loadingIndicatorWidget()
        : alignment == AppButtonAlignment.horizontal
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  leftWidget(),
                  buttonText(),
                  rightWidget(),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  leftWidget(),
                  buttonText(),
                  rightWidget(),
                ],
              );
  }

  Widget buttonText() {
    return textWidget == null
        ? text != null
            ? Flexible(
                child: Padding(
                  padding: textPadding,
                  child: Text(
                    text!,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.custom(
                      size: fontSize ?? 16,
                      color: enable ? textColor : disabledTextColor,
                      fontWeight: fontWeight,
                      fontFamily: fontFamily,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink()
        : textWidget!;
  }

  Widget leftWidget() {
    if (prefixIconWidget != null) {
      return prefixIconWidget!;
    }

    if (prefixIcon != null) {
      return Icon(
        prefixIcon,
        color: enable ? (prefixIconColor ?? textColor) : disabledTextColor,
        size: (fontSize ?? 16) + 2,
      );
    }

    return const SizedBox.shrink();
  }

  Widget rightWidget() {
    if (suffixIconWidget != null) {
      return suffixIconWidget!;
    }

    if (suffixIcon != null) {
      return Icon(
        suffixIcon,
        color: enable ? (suffixIconColor ?? textColor) : disabledTextColor,
        size: (fontSize ?? 16) + 2,
      );
    }

    return const SizedBox.shrink();
  }

  Widget loadingIndicatorWidget() {
    return SizedBox(
      width: loadingIndicatorSize,
      height: loadingIndicatorSize,
      child: CircularProgressIndicator(
        color: loadingIndicatorColor,
      ),
    );
  }
}
