import 'package:flutter/material.dart';

import '../../app/asset/app_icons.dart';
import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_statistic_square.dart';
import '___sample_wrapper.dart';

class AppStatisticSquareamplesView extends StatefulWidget {
  const AppStatisticSquareamplesView({super.key});

  static const routeName = '/molecule-app-statistic-square';

  @override
  State<AppStatisticSquareamplesView> createState() => AppStatisticSquareamplesViewState();
}

class AppStatisticSquareamplesViewState extends State<AppStatisticSquareamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistic Square Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultStatisticSquare(),
            defaultStatisticSquareWithLongText(),
            customStatisticSquare(),
          ],
        ),
      ),
    );
  }

  Widget defaultStatisticSquare() {
    return SampleWrapper(
      title: 'Default Statistic Square',
      widget: AppStatisticSquare(
        onTap: () {},
        title: 'TITLE',
        data: 'DATA',
        dataUnit: 'data unit',
      ),
    );
  }

  Widget defaultStatisticSquareWithLongText() {
    return SampleWrapper(
      title: 'Default Statistic Square',
      widget: AspectRatio(
        aspectRatio: 1,
        child: AppStatisticSquare(
          onTap: () {},
          title: 'LOREM IPSUM DOLOR SIT AMET',
          data: 'THE DATA FONT SIZE WILL BE AUTIMATICALLY ADJUST',
          dataUnit: 'data unit font size will be automatically adjst',
        ),
      ),
    );
  }

  Widget customStatisticSquare() {
    return SampleWrapper(
      title: 'Custom Statistic Square',
      widget: AppStatisticSquare(
        onTap: () {},
        title: 'TITLE',
        data: 'DATA',
        dataUnit: 'data unit',
        colors: const [AppColors.redLv3, AppColors.redLv2],
        icon: AppIcons.receipt_tax,
        iconColor: AppColors.primary,
      ),
    );
  }
}
