import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

//
// TODO ENCAPSULATE IN A CLASS
//

const homeServiceColor = AppColors.redLv1;
const deliveryColor = AppColors.orangeLv1;
const selfServiceColor = AppColors.cyanLv1;
const dropServiceColor = AppColors.primary;
const betweenSpace = -0.2;
const incomeColor = AppColors.cyanLv1;
const spendingColor = AppColors.redLv1;

BarChartGroupData generateGroupDataOmzet(
  int x,
  double homeService,
  double dropService,
  double delivery,
  double selfService,
) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        fromY: homeService +
            betweenSpace +
            dropService +
            betweenSpace +
            selfService +
            betweenSpace,
        toY: homeService +
            betweenSpace +
            dropService +
            betweenSpace +
            selfService +
            betweenSpace +
            delivery,
        color: deliveryColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: homeService + betweenSpace + dropService + betweenSpace,
        toY: homeService +
            betweenSpace +
            dropService +
            betweenSpace +
            selfService,
        color: selfServiceColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: homeService + betweenSpace,
        toY: homeService + betweenSpace + dropService,
        color: dropServiceColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: 0,
        toY: homeService,
        color: homeServiceColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
    ],
  );
}

BarChartGroupData generateGroupDataProfit(
  int x,
  double income,
  double spending,
) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        fromY: income + betweenSpace,
        toY: income + betweenSpace + spending,
        color: spendingColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
      BarChartRodData(
        fromY: 0,
        toY: income,
        color: incomeColor,
        width: 18,
        borderSide: BorderSide(
          width: 4,
          color: AppColors.white,
        ),
      ),
    ],
  );
}
