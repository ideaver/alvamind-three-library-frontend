import '../../app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppSwipeIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;
  final bool center;
  final double indicatorWidth;
  final double indicatorHeight;
  final double borderRadius;
  final double indicatorSpacing;
  final EdgeInsets padding;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;

  const AppSwipeIndicator({
    super.key,
    this.currentIndex = 0,
    required this.length,
    this.center = true,
    this.indicatorWidth = 10,
    this.indicatorHeight = 10,
    this.borderRadius = 100,
    this.indicatorSpacing = AppSizes.padding / 2,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.activeIndicatorColor = AppColors.secondary,
    this.inactiveIndicatorColor = AppColors.darkBlueLv6,
  });

  @override
  Widget build(BuildContext context) {
    return center ? Center(child: indicator()) : indicator();
  }

  Widget indicator() {
    return Wrap(
      spacing: indicatorSpacing,
      runSpacing: indicatorSpacing,
      children: [
        ...List.generate(
          length,
          (index) {
            return Container(
              width: indicatorWidth,
              height: indicatorHeight,
              decoration: BoxDecoration(
                color: index == currentIndex ? activeIndicatorColor : inactiveIndicatorColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            );
          },
        )
      ],
    );
  }
}
