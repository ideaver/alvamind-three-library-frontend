import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  final double thickness;
  final EdgeInsets padding;
  final Color color;
  final bool isVertical;

  const AppDivider({
    super.key,
    this.thickness = 1,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
    this.color = AppColors.blackLv7,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: isVertical
          ? VerticalDivider(
              color: color,
              width: 0,
              thickness: thickness,
            )
          : Divider(
              color: color,
              height: 0,
              thickness: thickness,
            ),
    );
  }
}
