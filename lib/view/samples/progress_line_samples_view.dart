import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_progress_line.dart';
import 'sample_wrapper.dart';

class ProgressLineSamplesView extends StatefulWidget {
  const ProgressLineSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-progress-line-samples';

  @override
  State<ProgressLineSamplesView> createState() =>
      _ProgressLineSamplesViewState();
}

class _ProgressLineSamplesViewState extends State<ProgressLineSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Line Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultProgressLine(),
            progressLineCustomWidth(),
            progressLineCustomHeight(),
            progressLineCustomRadius(),
            progressLineWithoutLabel(),
            progressLineWithCustomValueLabel(),
            progressLineWithCustomStyle(),
          ],
        ),
      ),
    );
  }

  Widget defaultProgressLine() {
    return const SampleWrapper(
      title: 'Default Progress Line',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
      ),
    );
  }

  Widget progressLineCustomWidth() {
    return SampleWrapper(
      title: 'Progress Line Custom Width',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
        lineWidth: MediaQuery.of(context).size.width / 2,
      ),
    );
  }

  Widget progressLineCustomHeight() {
    return const SampleWrapper(
      title: 'Progress Line Custom Height',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
        lineHeight: 50,
      ),
    );
  }

  Widget progressLineCustomRadius() {
    return const SampleWrapper(
      title: 'Progress Line Custom Radius',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
        borderRadius: 4,
      ),
    );
  }

  Widget progressLineWithoutLabel() {
    return const SampleWrapper(
      title: 'Progress Line Without Label',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        showLabel: false,
      ),
    );
  }

  Widget progressLineWithCustomValueLabel() {
    return const SampleWrapper(
      title: 'Progress Line With Custom Value Label',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
        valueLabel: '40.0000001',
      ),
    );
  }

  Widget progressLineWithCustomStyle() {
    return SampleWrapper(
      title: 'Progress Line Custom Style',
      widget: AppProgressLine(
        value: 40,
        maxValue: 100,
        label: 'Labeling',
        lineColor: AppColors.redLv1,
        lineBackgroundColor: AppColors.redLv7,
        labelStyle: AppTextStyle.bold(size: 14, color: AppColors.primary),
        valueLabelStyle: AppTextStyle.bold(size: 14, color: AppColors.redLv1),
      ),
    );
  }
}
