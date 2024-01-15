import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppProgressLine extends StatelessWidget {
  final double? lineWidth;
  final double lineHeight;
  final double maxValue;
  final double value;
  final double borderRadius;
  final bool showLabel;
  final String? label;
  final String? valueLabel;
  final int fractionDigits;
  final TextStyle? labelStyle;
  final TextStyle? valueLabelStyle;
  final Color lineColor;
  final Color lineBackgroundColor;
  final Color labelColor;
  final Color valueLabelColor;
  final EdgeInsets labelPadding;

  const AppProgressLine({
    Key? key,
    this.lineWidth,
    this.lineHeight = 14,
    required this.maxValue,
    required this.value,
    this.borderRadius = 100,
    this.showLabel = true,
    this.label,
    this.valueLabel,
    this.fractionDigits = 0,
    this.labelStyle,
    this.valueLabelStyle,
    this.lineColor = AppColors.primary,
    this.lineBackgroundColor = AppColors.blackLv8,
    this.labelColor = AppColors.blackLv4,
    this.valueLabelColor = AppColors.blackLv4,
    this.labelPadding = const EdgeInsets.only(top: 8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lineWidth,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: lineHeight,
                width: lineWidth ?? constraints.maxWidth,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: lineBackgroundColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                child: Container(
                  height: lineHeight,
                  width: value / (maxValue) * constraints.maxWidth,
                  decoration: BoxDecoration(
                    color: lineColor,
                    borderRadius: BorderRadius.circular(borderRadius),
                  ),
                ),
              ),
              !showLabel
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: labelPadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            label ?? '',
                            style: labelStyle ??
                                AppTextStyle.bodySmall(
                                  fontWeight: AppFontWeight.regular,
                                  color: labelColor,
                                ),
                          ),
                          Text(
                            valueLabel ?? '${(value / maxValue * 100).toStringAsFixed(fractionDigits)}%',
                            style: valueLabelStyle ??
                                AppTextStyle.bodySmall(
                                  fontWeight: AppFontWeight.regular,
                                  color: valueLabelColor,
                                ),
                          ),
                        ],
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
