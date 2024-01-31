import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

enum DividerType {
  solid,
  dashed,
}

class AppDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final double dashWidth;
  final double thickness;
  final double dashFillRate;
  final EdgeInsets padding;
  final Color color;
  final Axis direction;
  final DividerType type;

  const AppDivider({
    super.key,
    this.width,
    this.height,
    this.dashWidth = 4,
    this.thickness = 1,
    this.dashFillRate = 0.7,
    this.padding = const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
    this.color = AppColors.blackLv7,
    this.direction = Axis.horizontal,
    this.type = DividerType.solid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      height: height,
      child: type == DividerType.solid ? solidDivider() : dashedDivider(),
    );
  }

  Widget solidDivider() {
    return direction == Axis.vertical
        ? VerticalDivider(
            color: color,
            width: 0,
            thickness: thickness,
          )
        : Divider(
            color: color,
            height: 0,
            thickness: thickness,
          );
  }

  Widget dashedDivider() {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final boxSize = direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();
      final dCount = (boxSize * dashFillRate / dashWidth).floor();
      return SizedBox(
        width: direction == Axis.horizontal ? boxSize : width,
        height: direction == Axis.horizontal ? height : boxSize,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
          children: List.generate(dCount, (_) {
            return SizedBox(
              width: direction == Axis.horizontal ? dashWidth : thickness,
              height: direction == Axis.horizontal ? thickness : dashWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        ),
      );
    });
  }
}
