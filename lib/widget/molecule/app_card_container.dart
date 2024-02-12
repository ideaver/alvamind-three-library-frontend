import '../../app/asset/app_assets.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';

class AppCardContainer extends StatelessWidget {
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final bool withBackground;

  const AppCardContainer({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.margin,
    this.padding,
    this.child,
    this.boxShadow,
    this.gradient,
    this.height,
    this.width,
    this.withBackground = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.padding),
        boxShadow: boxShadow ?? [AppShadows.cardShadow1],
        gradient: gradient,
      ),
      child: !withBackground
          ? Container(
              padding: padding ?? const EdgeInsets.all(AppSizes.padding),
              margin: margin ?? EdgeInsets.zero,
              child: child,
            )
          : childWithBackground(),
    );
  }

  Widget childWithBackground() {
    return Stack(
      children: [
        Positioned(
          top: 75,
          left: 200,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(AppAssets.cubeImage,
                width: 100, height: 100, package: 'alvamind_library'),
          ),
        ),
        Positioned(
          top: 247,
          left: 223,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(AppAssets.cubeImage,
                width: 100, height: 100, package: 'alvamind_library'),
          ),
        ),
        Positioned(
          top: 38,
          right: 242,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(AppAssets.cubeImage,
                width: 250, height: 282, package: 'alvamind_library'),
          ),
        ),
        Positioned(
          left: 232,
          bottom: 86,
          child: Opacity(
            opacity: 0.5,
            child: Image.asset(AppAssets.cubeImage,
                width: 250, height: 282, package: 'alvamind_library'),
          ),
        ),
        Container(
          padding: padding ?? const EdgeInsets.all(AppSizes.padding),
          margin: margin ?? EdgeInsets.zero,
          child: child,
        )
      ],
    );
  }
}
