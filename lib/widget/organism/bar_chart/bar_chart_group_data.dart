import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

//
// TODO ENCAPSULATE IN A CLASS
//

const linkTransactionServiceColor = AppColors.cyanLv1;
const cuponTransactionServiceColor = AppColors.redLv1;
const betweenSpace = -0.2;

BarChartGroupData generateGroupDataSemuaRiwayat(
  int x,
  double linkTransaction,
  double cuponTransaction,
) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        fromY: linkTransaction + betweenSpace,
        toY: linkTransaction + betweenSpace + cuponTransaction,
        color: linkTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: 0,
        toY: linkTransaction,
        color: cuponTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
    ],
  );
}

BarChartGroupData generateGroupDataLinkRiwayat(
  int x,
  double linkTransaction,
) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        fromY: linkTransaction + linkTransaction,
        toY: linkTransaction + linkTransaction,
        color: linkTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: 0,
        toY: linkTransaction,
        color: linkTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
    ],
  );
}

BarChartGroupData generateGroupDataCuponRiwayat(
  int x,
  double cuponTransaction,
) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        fromY: cuponTransaction + cuponTransaction,
        toY: cuponTransaction + cuponTransaction,
        color: cuponTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: 0,
        toY: cuponTransaction,
        color: cuponTransactionServiceColor,
        width: 18,
        borderSide: const BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
    ],
  );
}
