import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppChips extends StatelessWidget {
  final bool isSelected;
  final bool enable;
  final double fontSize;
  final double? borderWidth;
  final EdgeInsets padding;
  final Color selectedColor;
  final Color unselectedColor;
  final Color disabledColor;
  final String text;
  final TextStyle? textStyle;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final Function() onTap;

  const AppChips({
    super.key,
    this.fontSize = 18,
    this.borderWidth = 2,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
    this.enable = true,
    this.selectedColor = AppColors.primary,
    this.unselectedColor = AppColors.white,
    this.disabledColor = AppColors.disabled,
    this.leftIcon,
    this.rightIcon,
    this.textStyle,
    required this.text,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(100),
      child: InkWell(
        onTap: enable ? onTap : null,
        splashColor: AppColors.black.withOpacity(0.06),
        splashFactory: InkRipple.splashFactory,
        highlightColor: enable ? AppColors.black.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          padding: padding,
          decoration: BoxDecoration(
            color: enable
                ? isSelected
                    ? selectedColor
                    : unselectedColor
                : disabledColor,
            borderRadius: BorderRadius.circular(100),
            border: borderWidth != null
                ? Border.all(
                    width: borderWidth!,
                    color: enable
                        ? isSelected
                            ? unselectedColor
                            : selectedColor
                        : disabledColor,
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
      style: textStyle ??
          AppTextStyle.bold(
            size: fontSize,
            color: enable
                ? isSelected
                    ? unselectedColor
                    : selectedColor
                : disabledColor,
          ),
    );
  }

  Widget leftIconWidget() {
    if (leftIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Icon(
        leftIcon,
        color: enable
            ? isSelected
                ? unselectedColor
                : selectedColor
            : disabledColor,
        size: fontSize + 2,
      ),
    );
  }

  Widget rightIconWidget() {
    if (rightIcon == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Icon(
        rightIcon,
        color: enable
            ? isSelected
                ? unselectedColor
                : selectedColor
            : disabledColor,
        size: fontSize + 2,
      ),
    );
  }
}
