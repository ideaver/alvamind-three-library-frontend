import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/atom/app_dotted_border.dart';
import 'sample_wrapper.dart';

class DottedBorderSamplesView extends StatefulWidget {
  const DottedBorderSamplesView({Key? key}) : super(key: key);

  static const routeName = '/atom-dotted-border-samples';

  @override
  State<DottedBorderSamplesView> createState() => _DottedBorderSamplesViewState();
}

class _DottedBorderSamplesViewState extends State<DottedBorderSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dotted Border Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultDottedBorder(),
            dottedBorderCustom(),
          ],
        ),
      ),
    );
  }

  Widget defaultDottedBorder() {
    return SampleWrapper(
      title: 'Default Dotted Border',
      widget: AppDottedBorder(
        child: Text(
          'Child',
          style: AppTextStyle.bodyMedium(
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget dottedBorderCustom() {
    return SampleWrapper(
      title: 'Dotted Border Custom',
      widget: AppDottedBorder(
        color: AppColors.primary,
        strokeWidth: 2,
        radius: 12,
        borderType: BorderType.Circle,
        child: Text(
          'Child',
          style: AppTextStyle.bodyMedium(
            fontWeight: AppFontWeight.bold,
          ),
        ),
      ),
    );
  }
}
