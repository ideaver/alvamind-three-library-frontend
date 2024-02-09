import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';

class Chart extends StatelessWidget {
  final List<BarChartGroupData> listValueChart;
  final int tagSelected;

  const Chart({
    Key? key,
    required this.listValueChart,
    required this.tagSelected,
  }) : super(key: key);

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 2:
        text = '2.5K';
        break;
      case 4:
        text = '5K';
        break;
      case 6:
        text = '7.5K';
        break;
      case 8:
        text = '10K';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 10);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'JAN';
        break;
      case 1:
        text = 'FEB';
        break;
      case 2:
        text = 'MAR';
        break;
      case 3:
        text = 'APR';
        break;
      case 4:
        text = 'MAY';
        break;
      case 5:
        text = 'JUN';
        break;
      case 6:
        text = 'JUL';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1.2,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceBetween,
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: leftTitles,
                    reservedSize: 30,
                  ),
                ),
                rightTitles: const AxisTitles(),
                topTitles: const AxisTitles(),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: bottomTitles,
                    reservedSize: 20,
                  ),
                ),
              ),
              barTouchData: BarTouchData(
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: AppColors.white,
                  tooltipRoundedRadius: 10,
                  tooltipBorder: const BorderSide(
                    width: 1,
                    color: AppColors.primary,
                  ),
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    String month = '';
                    switch (groupIndex) {
                      case 0:
                        month = 'Januari';
                        break;
                      case 1:
                        month = 'Februari';
                        break;
                      case 2:
                        month = 'Maret';
                        break;
                      case 3:
                        month = 'April';
                        break;
                      case 4:
                        month = 'Mei';
                        break;
                      case 5:
                        month = 'Juni';
                        break;
                      case 6:
                        month = 'Juli';
                        break;
                    }
                    String type;
                    String value = rod.toY.toString();

                    if (tagSelected == 0) {
                      type = rodIndex == 0 ? 'Link' : 'Cupon';
                    } else if (tagSelected == 1) {
                      type = 'Link';
                    } else {
                      type = 'Cupon';
                    }
                    return BarTooltipItem(
                      '',
                      AppTextStyle.bodyXSmall(
                        fontWeight: AppFontWeight.semibold,
                        color: type == 'Link' ? Colors.blue : Colors.red,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: '$month\n',
                            style: AppTextStyle.bodyXSmall(
                              fontWeight: AppFontWeight.semibold,
                              color: type == 'Link' ? Colors.blue : Colors.red,
                            )),
                        TextSpan(
                            text: '• $value - $type\n',
                            style: AppTextStyle.bodyXSmall(
                                fontWeight: AppFontWeight.semibold,
                                color: AppColors.blackLv5)),
                      ],
                    );
                  },
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              barGroups: listValueChart,
              extraLinesData: ExtraLinesData(
                extraLinesOnTop: false,
                horizontalLines: [
                  ...List.generate(5, (i) {
                    return HorizontalLine(
                      y: i == 1
                          ? 2
                          : i == 2
                              ? 4
                              : i == 3
                                  ? 6
                                  : i == 4
                                      ? 8
                                      : 0,
                      color: AppColors.blackLv7,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
