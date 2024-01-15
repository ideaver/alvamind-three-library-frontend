import 'package:flutter/cupertino.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppToggle extends StatelessWidget {
  final bool enable;
  final bool value;
  final String? title;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle? titleStyle;
  final EdgeInsets padding;
  final Function(bool) onChanged;

  const AppToggle({
    Key? key,
    this.enable = true,
    required this.value,
    this.title,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.blackLv8,
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
        child: Row(
          children: [
            CupertinoSwitch(
              value: value,
              onChanged: (val) {
                if (enable) {
                  onChanged(val);
                }
              },
              trackColor: value ? activeColor : inactiveColor,
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
      ),
    );
  }
}
