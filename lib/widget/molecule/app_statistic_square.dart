import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppStatisticSquare extends StatelessWidget {
  final String title;
  final String data;
  final String? dataUnit;
  final double borderRadius;
  final double? iconBorderRadius;
  final double iconSize;
  final EdgeInsets padding;
  final IconData icon;
  final Color? shadowColor;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Color textColor;
  final List<Color> colors;
  final Function()? onTap;

  const AppStatisticSquare({
    super.key,
    this.onTap,
    required this.title,
    required this.data,
    this.dataUnit,
    this.borderRadius = AppSizes.radius * 3,
    this.iconBorderRadius = (AppSizes.radius * 3) - AppSizes.padding / 2,
    this.iconSize = 24,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.icon = Icons.stacked_bar_chart_rounded,
    this.shadowColor,
    this.iconColor = AppColors.primary,
    this.iconBackgroundColor,
    this.textColor = AppColors.white,
    this.colors = const [AppColors.blueLv2, AppColors.blueLv1],
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor ?? colors.last.withOpacity(0.32),
              offset: const Offset(0, 6),
              blurRadius: 12,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: padding / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(iconBorderRadius ?? borderRadius),
                color: iconBackgroundColor ?? AppColors.white,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: iconSize,
              ),
            ),
            const SizedBox(height: AppSizes.padding),
            Text(
              title,
              style: AppTextStyle.bodySmall(
                fontWeight: AppFontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: AppSizes.padding / 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    data,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold(
                      color: textColor,
                      // Relative size, bigger length smallest size
                      size: data.length > 5
                          ? (200 / data.length) >= 12
                              ? 200 / data.length
                              : 12
                          : 28,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    dataUnit ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.regular(
                      color: textColor,
                      size: (dataUnit ?? '').length > 5
                          ? (100 / (dataUnit ?? '').length) >= 8
                              ? 100 / (dataUnit ?? '').length
                              : 8
                          : 12,
                      height: 1.8,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
