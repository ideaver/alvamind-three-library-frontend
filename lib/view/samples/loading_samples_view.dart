import 'package:flutter/material.dart';

import '../../widget/atom/app_progress_indicator.dart';
import 'sample_wrapper.dart';

class LoadingSamplesView extends StatefulWidget {
  const LoadingSamplesView({Key? key}) : super(key: key);

  static const routeName = '/atom-loading-samples';

  @override
  State<LoadingSamplesView> createState() => _LoadingSamplesViewState();
}

class _LoadingSamplesViewState extends State<LoadingSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Loading Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loadingWithText(),
            loadingWidgetOnly(),
          ],
        ),
      ),
    );
  }

  Widget loadingWithText() {
    return const SampleWrapper(
      title: 'Loading With Text',
      widget: AppProgressIndicator(),
    );
  }

  Widget loadingWidgetOnly() {
    return const SampleWrapper(
      title: 'Loading Widget only',
      widget: AppProgressIndicator(
        showMessage: false,
      ),
    );
  }
}
