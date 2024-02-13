import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../molecule/app_button.dart';
import '../../molecule/app_card_container.dart';
import '../../molecule/app_icon_button.dart';
import '../../molecule/app_long_card.dart';

class BarChart extends StatefulWidget {
  final String selectedOptionDate;
  final Function() onTapDate;

  final String textTypeChart;
  final String? textDateRange;
  final String? countTotal;
  final Color? countTotalColor;
  final String? countTransaction;
  final Widget tagBar;
  final Widget barChart;
  final dynamic Function(dynamic) onTapItem;

  const BarChart({
    super.key,
    required this.textTypeChart,
    required this.barChart,
    required this.tagBar,
    required this.onTapItem,
    required this.onTapDate,
    required this.selectedOptionDate,
    this.countTotal,
    this.countTransaction,
    this.textDateRange,
    this.countTotalColor,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      // boxShadow: [
      //   BoxShadow(
      //     color: AppColors.blackLv7.withOpacity(0.5),
      //     offset: const Offset(0, 4),
      //     blurRadius: 60,
      //     spreadRadius: 0,
      //   ),
      // ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppLongCard(
            padding: EdgeInsets.zero,
            children: [
              Expanded(
                child: Row(
                  children: [
                    AppIconButton(
                      buttonColor: AppColors.blueLv5,
                      icon: const Icon(
                        CustomIcon.chartBoldIcon,
                        color: AppColors.primary,
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(width: AppSizes.padding / 1.5),
                    Expanded(
                      child: Text(
                        widget.textTypeChart,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                        style: AppTextStyle.bold(size: 24),
                      ),
                    )
                  ],
                ),
              ),
              AppButton(
                  padding: const EdgeInsets.all(AppSizes.padding / 2),
                  suffixIcon: Icons.keyboard_arrow_down,
                  buttonColor: AppColors.white,
                  suffixIconColor: AppColors.blackLv5,
                  borderColor: AppColors.blackLv5,
                  textColor: AppColors.blackLv5,
                  textWidget: Text(
                    widget.selectedOptionDate,
                    style: AppTextStyle.bodySmall(fontWeight: AppFontWeight.semibold, color: AppColors.blackLv5),
                  ),
                  borderWidth: 1,
                  onTap: widget.onTapDate)
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.textDateRange ?? '1 Jan 2023 - 31 Juli 2023',
                  style: AppTextStyle.regular(size: 14, color: AppColors.blackLv4)),
              const SizedBox(height: AppSizes.padding / 2),
              Text(widget.countTotal ?? 'Rp 687.375.337',
                  style: AppTextStyle.bold(size: 24, color: widget.countTotalColor ?? AppColors.black)),
              const SizedBox(height: AppSizes.padding / 2),
              Text('${widget.countTransaction} Transaksi',
                  style: AppTextStyle.regular(size: 14, color: AppColors.blackLv4)),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          widget.tagBar,
          const SizedBox(height: AppSizes.padding),
          widget.barChart,
        ],
      ),
    );
  }
}
