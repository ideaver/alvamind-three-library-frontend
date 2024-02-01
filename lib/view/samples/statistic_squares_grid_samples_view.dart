import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_statistic_square.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/organism/statistic_squares_grid.dart';
import '___sample_wrapper.dart';

class StatisticSquaresGridamplesView extends StatefulWidget {
  const StatisticSquaresGridamplesView({super.key});

  static const routeName = '/organism-statistic-squares-grid';

  @override
  State<StatisticSquaresGridamplesView> createState() => StatisticSquaresGridamplesViewState();
}

class StatisticSquaresGridamplesViewState extends State<StatisticSquaresGridamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistic Squares Grid Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultStatisticSquaresGrid(),
          ],
        ),
      ),
    );
  }

  Widget defaultStatisticSquaresGrid() {
    return SampleWrapper(
      title: 'Default Statistic Squares Grid',
      widget: StatisticSquaresGrid(
        statisticSquares: listStatistic,
      ),
    );
  }

  List<AppStatisticSquare> listStatistic = [
    const AppStatisticSquare(
      title: 'TERJUAL',
      data: '200',
      dataUnit: 'item',
      colors: [AppColors.blueLv3, AppColors.blueLv2],
      icon: AppIcons.money1,
      iconColor: AppColors.primary,
    ),
    const AppStatisticSquare(
      title: 'KONVERSI',
      data: '25',
      dataUnit: '%',
      colors: [AppColors.orangeLv3, AppColors.orangeLv2],
      icon: Icons.balance_rounded,
      iconColor: AppColors.primary,
    ),
    const AppStatisticSquare(
      title: 'TOTAL REFERRAL',
      data: '37',
      dataUnit: 'referral',
      colors: [AppColors.greenLv3, AppColors.greenLv2],
      icon: AppIcons.receipt_tax,
      iconColor: AppColors.primary,
    ),
    const AppStatisticSquare(
      title: 'TOTAL PENGGUNA',
      data: '43',
      dataUnit: 'pengguna',
      colors: [AppColors.redLv3, AppColors.redLv2],
      icon: AppIcons.user,
      iconColor: AppColors.primary,
    ),
  ];
}
