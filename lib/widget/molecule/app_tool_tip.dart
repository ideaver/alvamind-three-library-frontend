import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppToolTipMenu extends StatelessWidget {
  final bool enabled;
  final Widget? child;
  final String? title;
  final TextStyle? style;
  final double fontSize;
  final double iconSize;
  final double? width;
  final double? borderWidth;
  final double borderRadius;
  final double itemsBorderRadius;
  final double elevation;
  final EdgeInsets padding;
  final EdgeInsets? itemPadding;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color borderColor;
  final Color shadowColor;
  final Color itemsBackgroundColor;
  final Offset? offset;
  final BoxConstraints? itemsConstraint;
  final List<Widget> children;
  final Function(int) onTapItem;

  const AppToolTipMenu({
    Key? key,
    this.enabled = true,
    this.child,
    this.title,
    this.style,
    this.fontSize = 16,
    this.iconSize = 24,
    this.width,
    this.borderWidth,
    this.borderRadius = 12,
    this.itemsBorderRadius = 6,
    this.elevation = 4,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    this.itemPadding = const EdgeInsets.all(12),
    this.backgroundColor = AppColors.transparent,
    this.iconColor = AppColors.blackLv1,
    this.titleColor = AppColors.blackLv1,
    this.borderColor = AppColors.blackLv8,
    this.shadowColor = AppColors.blackLv9,
    this.itemsBackgroundColor = AppColors.white,
    this.offset,
    this.itemsConstraint,
    required this.children,
    required this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: width != null ? BoxConstraints(maxWidth: width!) : null,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: borderWidth != null
            ? Border.all(
                width: borderWidth!,
                color: borderColor,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashColor: AppColors.blackLv9,
        ),
        child: PopupMenuButton(
          color: itemsBackgroundColor,
          enabled: enabled,
          constraints: itemsConstraint,
          elevation: elevation,
          shadowColor: shadowColor.withOpacity(0.54),
          offset: offset ??
              Offset(
                0 - padding.left,
                (padding.top * 2) + (borderWidth ?? 1) + 2,
              ),
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            side: borderWidth != null
                ? BorderSide(
                    width: borderWidth!,
                    color: borderColor,
                  )
                : BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(itemsBorderRadius),
            ),
          ),
          child: child ??
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: width != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: padding == EdgeInsets.zero ? 0 : 4.0,
                      ),
                      child: Text(
                        title ?? '',
                        overflow: TextOverflow.ellipsis,
                        style: style ??
                            AppTextStyle.bold(
                              size: fontSize,
                              color: titleColor,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: iconColor,
                    size: iconSize,
                  ),
                ],
              ),
          itemBuilder: (context) {
            return List.generate(
              children.length,
              (i) {
                return PopupMenuItem(
                  padding: itemPadding,
                  height: 0,
                  onTap: () {
                    onTapItem(i);
                  },
                  child: children[i],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
