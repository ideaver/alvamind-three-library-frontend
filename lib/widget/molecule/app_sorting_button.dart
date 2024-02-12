import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppSortingButton extends StatelessWidget {
  final Function() onTapFirst;
  final Function() onTapSecond;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final bool rounded;
  final double borderRadius;
  final String firstText;
  final String secondText;
  final IconData firstIcon;
  final IconData secondIcon;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color iconColor;

  const AppSortingButton({
    super.key,
    this.height,
    this.width,
    this.backgroundColor,
    this.rounded = true,
    this.borderRadius = 100,
    this.padding,
    this.textStyle,
    required this.firstText,
    required this.secondText,
    required this.firstIcon,
    required this.secondIcon,
    this.iconColor = AppColors.white,
    required this.onTapFirst,
    required this.onTapSecond,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: height ?? 44,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.secondary,
        borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(AppSizes.padding / 3),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: onTapFirst,
              child: Row(
                children: [
                  Icon(
                    firstIcon,
                    color: iconColor,
                    size: 20,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    firstText,
                    style: textStyle ??
                        AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.semibold,
                          color: iconColor,
                        ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenSize.height,
              width: 1,
              color: AppColors.blackLv9,
            ),
            InkWell(
              onTap: onTapSecond,
              child: Row(
                children: [
                  Icon(
                    secondIcon,
                    color: iconColor,
                    size: 20,
                  ),
                  const SizedBox(width: AppSizes.padding / 2),
                  Text(
                    secondText,
                    style: textStyle ??
                        AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.semibold,
                          color: iconColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
