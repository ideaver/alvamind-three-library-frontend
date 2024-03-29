import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/segmented_button_model.dart';

// TODO UNDONE
class AppSegmentedButton extends StatelessWidget {
  final List<SegmentedButtonModel> tabs;
  final Function() onTapFirst;
  final Function() onTapSecond;
  final double? width;
  final double height;
  final Color backgroundColor;
  final bool rounded;
  final double borderRadius;
  final String firstText;
  final String secondText;
  final IconData firstIcon;
  final IconData secondIcon;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final Color iconColor;

  const AppSegmentedButton({
    super.key,
    this.height = 44,
    this.width = 212,
    this.backgroundColor = AppColors.secondary,
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
    required this.tabs,
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
          ),
          Container(
            height: height / 2.5,
            width: 1,
            color: AppColors.blackLv4,
          ),
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
          ),
        ],
      ),
    );
  }
}
