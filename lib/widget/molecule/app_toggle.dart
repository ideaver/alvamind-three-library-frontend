import 'package:alvamind_three_library_frontend/app/theme/app_shadows.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppToggle extends StatefulWidget {
  final bool enable;
  final bool value;
  final bool showInactiveIcon;
  final String? title;
  final TextStyle? titleStyle;
  final EdgeInsets padding;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeIconColor;
  final Color inactiveIconColor;
  final Color iconBackgroundColor;
  final IconData? activeIcon;
  final IconData? inactiveIcon;
  final Widget? activeIconWidget;
  final Widget? inactiveIconWidget;
  final double childWidth;
  final double childHeight;
  final double borderRadius;
  final Function(bool) onChanged;

  const AppToggle({
    super.key,
    this.enable = true,
    this.showInactiveIcon = true,
    required this.value,
    this.title,
    this.padding = const EdgeInsets.all(4),
    this.titleStyle,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.blackLv2,
    this.activeIconColor = AppColors.primary,
    this.inactiveIconColor = AppColors.blackLv2,
    this.iconBackgroundColor = AppColors.white,
    this.activeIcon,
    this.inactiveIcon,
    this.activeIconWidget,
    this.inactiveIconWidget,
    this.childWidth = 32,
    this.childHeight = 32,
    this.borderRadius = 100,
    required this.onChanged,
  });

  @override
  State<AppToggle> createState() => _AppToggleState();
}

class _AppToggleState extends State<AppToggle> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enable ? 1 : 0.5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: (widget.childWidth * 2) + (widget.padding.left + widget.padding.right),
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: AppColors.white,
              ),
              child: widget.showInactiveIcon ? showedInactiveIconChild() : child(),
            ),
          ),
          widget.title != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    widget.title!,
                    style: widget.titleStyle ??
                        AppTextStyle.bodyMedium(
                          fontWeight: AppFontWeight.semibold,
                        ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget showedInactiveIconChild() {
    return Stack(
      children: [
        AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.decelerate,
          alignment: Alignment.centerLeft,
          child: Container(
            width: widget.childWidth,
            height: widget.childHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: AppColors.white,
              boxShadow: [AppShadows.darkShadow5],
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: widget.childWidth,
              height: widget.childHeight,
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.primary,
                size: 32 / 1.5,
              ),
            ),
            SizedBox(
              width: widget.childWidth,
              height: widget.childHeight,
              child: const Icon(
                Icons.check_rounded,
                color: AppColors.primary,
                size: 32 / 1.5,
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget child() {
    return AnimatedAlign(
      duration: const Duration(milliseconds: 300),
      curve: Curves.decelerate,
      alignment: Alignment.centerLeft,
      child: Container(
        width: widget.childWidth,
        height: widget.childHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: AppColors.white,
          boxShadow: [AppShadows.darkShadow5],
        ),
        child: const Icon(
          Icons.check_rounded,
          color: AppColors.primary,
          size: 32 / 1.5,
        ),
      ),
    );
  }
}
