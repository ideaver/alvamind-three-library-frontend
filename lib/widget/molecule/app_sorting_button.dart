import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppSortingButton extends StatelessWidget {
  final Function() onTapFirst;
  final Function()? onTapSecond;
  final double? width;
  final double height;
  final Color backgroundColor;
  final bool rounded;
  final double borderRadius;
  final String firstText;
  final String? secondText;
  final IconData firstIcon;
  final IconData? secondIcon;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color firstIconColor;
  final Color secondIconColor;

  const AppSortingButton({
    super.key,
    this.height = 44,
    this.width = 212,
    this.backgroundColor = AppColors.secondary,
    this.rounded = true,
    this.borderRadius = 100,
    this.padding,
    this.textStyle,
    required this.firstText,
    this.secondText,
    required this.firstIcon,
    this.secondIcon,
    this.firstIconColor = AppColors.white,
    this.secondIconColor = AppColors.white,
    required this.onTapFirst,
    this.onTapSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
        boxShadow: [AppShadows.darkShadow6],
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: onTapFirst,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(rounded ? 100 : borderRadius),
                bottomLeft: Radius.circular(rounded ? 100 : borderRadius),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    firstIcon,
                    color: firstIconColor,
                    size: 20,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    firstText,
                    style: textStyle ??
                        AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.semibold,
                          color: firstIconColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: secondText != null && secondIcon != null,
            child: Container(
              height: height / 2.5,
              width: 1,
              color: AppColors.blackLv4,
            ),
          ),
          if (secondText != null && secondIcon != null)
            Flexible(
              flex: 1,
              child: InkWell(
                onTap: onTapSecond,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(rounded ? 100 : borderRadius),
                  bottomRight: Radius.circular(rounded ? 100 : borderRadius),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      secondIcon,
                      color: secondIconColor,
                      size: 20,
                    ),
                    const SizedBox(width: AppSizes.padding / 2),
                    Text(
                      secondText ?? '',
                      style: textStyle ??
                          AppTextStyle.bodySmall(
                            fontWeight: AppFontWeight.semibold,
                            color: secondIconColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
