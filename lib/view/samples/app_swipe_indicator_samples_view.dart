import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/molecule/app_swipe_indicator.dart';
import '___sample_wrapper.dart';

class AppSwipeIndicatorSamplesView extends StatefulWidget {
  const AppSwipeIndicatorSamplesView({super.key});

  static const routeName = '/molecule-app-swipe-indicator';

  @override
  State<AppSwipeIndicatorSamplesView> createState() => _AppSwipeIndicatorSamplesViewState();
}

class _AppSwipeIndicatorSamplesViewState extends State<AppSwipeIndicatorSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe Indicator Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSwipeIndicator(),
            customSwipeIndicator(),
          ],
        ),
      ),
    );
  }

  Widget defaultSwipeIndicator() {
    return const SampleWrapper(
      title: 'Default Swipe Indicator',
      widget: AppSwipeIndicator(
        length: 5,
      ),
    );
  }

  Widget customSwipeIndicator() {
    return const SampleWrapper(
      title: 'Custom Swipe Indicator',
      widget: AppSwipeIndicator(
        length: 5,
        activeIndicatorColor: AppColors.primary,
        inactiveIndicatorColor: AppColors.blueLv6,
        indicatorWidth: 45,
        indicatorHeight: 6,
        indicatorSpacing: AppSizes.padding / 4,
      ),
    );
  }
}
