import 'package:flutter/material.dart';

import '../../widget/atom/app_progress_indicator.dart';
import '___sample_wrapper.dart';

class AppProgressIndicatorSamplesView extends StatefulWidget {
  const AppProgressIndicatorSamplesView({super.key});

  static const routeName = '/atom-app-progress-indicator';

  @override
  State<AppProgressIndicatorSamplesView> createState() => _AppProgressIndicatorSamplesViewState();
}

class _AppProgressIndicatorSamplesViewState extends State<AppProgressIndicatorSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress Indicator Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            progressIndicatorWithText(),
            progressIndicatorWidgetOnly(),
          ],
        ),
      ),
    );
  }

  Widget progressIndicatorWithText() {
    return const SampleWrapper(
      title: 'Progress Indicator With Text',
      widget: AppProgressIndicator(),
    );
  }

  Widget progressIndicatorWidgetOnly() {
    return const SampleWrapper(
      title: 'Progress Indicator Widget only',
      widget: AppProgressIndicator(
        showMessage: false,
      ),
    );
  }
}
