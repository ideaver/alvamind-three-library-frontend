import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/atom/app_divider.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class SampleWrapper extends StatelessWidget {
  final String title;
  final Widget widget;

  const SampleWrapper({
    super.key,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.bold(size: 14, color: AppColors.blackLv2),
          ),
          const SizedBox(height: AppSizes.padding),
          widget,
          const SizedBox(height: AppSizes.padding / 2),
          const AppDivider()
        ],
      ),
    );
  }
}
