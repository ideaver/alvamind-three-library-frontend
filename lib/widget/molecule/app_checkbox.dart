import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppCheckbox extends StatelessWidget {
  final bool enable;
  final bool? value;
  final String? title;
  final Widget? titleWidget;
  final String? errorText;
  final Color activeColor;
  final Color? fillColor;
  final TextStyle? titleStyle;
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;
  final Function(bool?) onChanged;

  const AppCheckbox({
    super.key,
    this.enable = true,
    required this.value,
    this.title,
    this.titleWidget,
    this.errorText,
    this.activeColor = AppColors.primary,
    this.fillColor,
    this.titleStyle,
    this.padding = EdgeInsets.zero,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enable ? 1 : 0.5,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: crossAxisAlignment,
              children: [
                checkBoxWidget(),
                titleTextWidget(),
              ],
            ),
            errorTextWidget(),
          ],
        ),
      ),
    );
  }

  Widget checkBoxWidget() {
    return Checkbox(
      value: value,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radius / 1.5),
      ),
      visualDensity: VisualDensity.compact,
      onChanged: (val) {
        if (enable) {
          onChanged(val);
        }
      },
      fillColor: errorText != null
          ? MaterialStateColor.resolveWith((states) => AppColors.redLv4)
          : fillColor != null
              ? MaterialStateColor.resolveWith((states) => fillColor!)
              : null,
      activeColor: activeColor,
      side: const BorderSide(width: 1.5, color: AppColors.blackLv6),
    );
  }

  Widget titleTextWidget() {
    if (titleWidget != null) {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: titleWidget!,
        ),
      );
    }

    if (title == null) {
      return const SizedBox.shrink();
    }

    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          title!,
          style: titleStyle ?? AppTextStyle.bodyMedium(fontWeight: AppFontWeight.semibold),
        ),
      ),
    );
  }

  Widget errorTextWidget() {
    if (errorText == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.padding / 2),
      child: Text(
        errorText!,
        style: AppTextStyle.regular(size: 11, color: AppColors.error),
      ),
    );
  }
}
