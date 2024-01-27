import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppToggle extends StatefulWidget {
  final bool enable;
  final bool value;
  final bool showInactiveIcon;
  final String? label;
  final TextStyle? labelStyle;
  final EdgeInsets toggleMargin;
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
  final double iconSize;
  final double borderRadius;
  final Function(bool) onChanged;

  const AppToggle({
    super.key,
    this.enable = true,
    this.showInactiveIcon = false,
    required this.value,
    this.label,
    this.toggleMargin = const EdgeInsets.only(right: AppSizes.padding / 2),
    this.padding = const EdgeInsets.all(4),
    this.labelStyle,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.blackLv2,
    this.activeIconColor = AppColors.primary,
    this.inactiveIconColor = AppColors.blackLv2,
    this.iconBackgroundColor = AppColors.white,
    this.activeIcon = Icons.check,
    this.inactiveIcon = Icons.remove,
    this.activeIconWidget,
    this.inactiveIconWidget,
    this.childWidth = 32,
    this.childHeight = 32,
    this.iconSize = 20,
    this.borderRadius = 100,
    required this.onChanged,
  });

  @override
  State<AppToggle> createState() => _AppToggleState();
}

class _AppToggleState extends State<AppToggle> {
  bool value = false;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  void onChanged({bool? val}) {
    if (widget.enable) {
      value = val ?? !value;
      setState(() {});
      widget.onChanged(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enable ? 1 : 0.5,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onChanged();
            },
            onPanUpdate: (details) {
              // Swiping in right direction.
              if (details.delta.dx > 0) {
                onChanged(val: true);
              }

              // Swiping in left direction.
              if (details.delta.dx < 0) {
                onChanged(val: false);
              }
            },
            child: Container(
              width: (widget.childWidth * 2) + (widget.padding.left + widget.padding.right),
              margin: widget.toggleMargin,
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                color: value ? widget.activeColor : widget.inactiveColor,
              ),
              child: widget.showInactiveIcon ? showedInactiveIconChild() : child(),
            ),
          ),
          widget.label != null
              ? Text(
                  widget.label!,
                  style: widget.labelStyle ??
                      AppTextStyle.bodyMedium(
                        fontWeight: AppFontWeight.semibold,
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
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
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
              child: Icon(
                widget.inactiveIcon,
                color: value ? widget.inactiveIconColor : widget.activeIconColor,
                size: widget.iconSize,
              ),
            ),
            SizedBox(
              width: widget.childWidth,
              height: widget.childHeight,
              child: Icon(
                widget.activeIcon,
                color: value ? widget.activeIconColor : widget.inactiveIconColor,
                size: widget.iconSize,
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
      alignment: value ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: widget.childWidth,
        height: widget.childHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          color: AppColors.white,
          boxShadow: [AppShadows.darkShadow5],
        ),
        child: Icon(
          value ? widget.activeIcon : widget.inactiveIcon,
          color: value ? widget.activeIconColor : widget.inactiveIconColor,
          size: widget.iconSize,
        ),
      ),
    );
  }
}
