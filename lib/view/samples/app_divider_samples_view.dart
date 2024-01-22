import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/atom/app_divider.dart';
import '___sample_wrapper.dart';

class AppDividerSamplesView extends StatefulWidget {
  const AppDividerSamplesView({super.key});

  static const routeName = '/atom-app-divider';

  @override
  State<AppDividerSamplesView> createState() => _AppDividerSamplesViewState();
}

class _AppDividerSamplesViewState extends State<AppDividerSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Divider Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultDivider(),
            verticalDivider(),
            horizontalDividerCustomStyle(),
          ],
        ),
      ),
    );
  }

  Widget defaultDivider() {
    return const SampleWrapper(
      title: 'Default Divider',
      widget: AppDivider(),
    );
  }

  Widget verticalDivider() {
    return const SampleWrapper(
      title: 'Vertical Divider',
      widget: SizedBox(
        height: 100,
        child: AppDivider(
          isVertical: true,
        ),
      ),
    );
  }

  Widget horizontalDividerCustomStyle() {
    return const SampleWrapper(
      title: 'Horizontal Divider Cutom Style',
      widget: AppDivider(
        color: AppColors.primary,
        thickness: 2,
        padding: EdgeInsets.all(12),
      ),
    );
  }
}
