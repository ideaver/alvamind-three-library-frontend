import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

class AppDottedBorder extends StatelessWidget {
  final Color color;
  final double strokeWidth;
  final double radius;
  final EdgeInsets? borderPadding;
  final EdgeInsets? childPadding;
  final List<double> dashPattern;
  final BorderType borderType;
  final Widget child;

  const AppDottedBorder({
    super.key,
    this.color = AppColors.blackLv4,
    this.strokeWidth = 1,
    this.radius = 8,
    this.borderPadding,
    this.childPadding,
    this.dashPattern = const <double>[8, 4],
    this.borderType = BorderType.RRect,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: color,
      strokeWidth: 1,
      radius: Radius.circular(radius),
      borderPadding: borderPadding ?? EdgeInsets.zero,
      dashPattern: dashPattern,
      borderType: borderType,
      strokeCap: StrokeCap.round,
      child: Padding(
        padding: childPadding ?? EdgeInsets.all(AppSizes.padding),
        child: child,
      ),
    );
  }
}
