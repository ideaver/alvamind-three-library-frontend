import 'package:flutter/material.dart';

import '../../app/theme/app_sizes.dart';

class AppInkwell extends StatelessWidget {
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final EdgeInsets padding;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final Function()? onTap;

  const AppInkwell({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.color,
    this.boxShadow,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
        boxShadow: boxShadow,
      ),
      child: Material(
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
        child: InkWell(
          onTap: onTap,
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
              borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
