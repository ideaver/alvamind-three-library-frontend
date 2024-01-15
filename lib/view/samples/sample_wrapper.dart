import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';

class SampleWrapper extends StatelessWidget {
  final String title;
  final Widget widget;

  const SampleWrapper({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.bold(size: 14),
        ),
        const SizedBox(height: 8),
        widget,
        const SizedBox(height: 24),
      ],
    );
  }
}
