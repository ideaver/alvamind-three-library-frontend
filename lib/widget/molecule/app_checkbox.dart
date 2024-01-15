import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';

class AppCheckbox extends StatelessWidget {
  final bool enable;
  final bool? value;
  final String? title;
  final String? errorText;
  final Color activeColor;
  final Color? fillColor;
  final TextStyle? titleStyle;
  final EdgeInsets padding;
  final Function(bool?) onChanged;

  const AppCheckbox({
    Key? key,
    this.enable = true,
    required this.value,
    this.title,
    this.errorText,
    this.activeColor = AppColors.primary,
    this.fillColor,
    this.titleStyle,
    this.padding = EdgeInsets.zero,
    required this.onChanged,
  }) : super(key: key);

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
              children: [
                Checkbox(
                  value: value,
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
                ),
                title != null
                    ? Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          title!,
                          style: titleStyle ??
                              AppTextStyle.bodyMedium(
                                fontWeight: AppFontWeight.semibold,
                              ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            errorText != null
                ? Padding(
                    padding: EdgeInsets.only(left: AppSizes.padding / 2),
                    child: Text(
                      errorText!,
                      style: AppTextStyle.regular(size: 11, color: AppColors.error),
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
