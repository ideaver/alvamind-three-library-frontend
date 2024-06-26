import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class AppInkwell extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderWidth;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets padding;
  final Color color;
  final Color borderColor;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final BoxBorder? customBorder;
  final Function()? onTap;
  final Function()? onLongPress;

  const AppInkwell({
    super.key,
    this.width,
    this.height,
    this.borderWidth,
    this.borderRadius,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.margin,
    this.color = AppColors.white,
    this.borderColor = AppColors.blackLv8,
    this.boxShadow,
    this.child,
    this.customBorder,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
        boxShadow: boxShadow,
      ),
      child: Material(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          splashColor: Colors.black.withOpacity(0.06),
          splashFactory: InkRipple.splashFactory,
          highlightColor: Colors.black12,
          borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
          child: Ink(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: color,
              border: customBorder ??
                  (borderWidth != null
                      ? Border.all(
                          width: borderWidth!,
                          color: borderColor,
                        )
                      : null),
              borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
