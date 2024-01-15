import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/theme/app_theme.dart';

// App Progress Indicator
class AppProgressIndicator extends StatelessWidget {
  final Color color;
  final Color? textColor;
  final double size;
  final double fontSize;
  final bool showMessage;
  final String message;

  const AppProgressIndicator({
    super.key,
    this.color = AppColors.primary,
    this.textColor,
    this.size = 42,
    this.fontSize = 10,
    this.showMessage = true,
    this.message = 'Please wait',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: LoadingIndicator(
              indicatorType: Indicator.ballSpinFadeLoader,
              colors: [color],
            ),
          ),
          showMessage
              ? Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    message,
                    style: AppTextStyle.bold(
                      size: fontSize,
                      color: textColor ??
                          (AppTheme.isLightMode
                              ? AppColors.blackLv1
                              : AppColors.white),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
