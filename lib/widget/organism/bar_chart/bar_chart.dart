import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_modal_referral.dart';
import '../../../app/asset/app_assets.dart';
import 'package:flutter/material.dart';
import '../../../app/theme/app_text_style.dart';
import '../../molecule/app_icon_button.dart';
import '../../molecule/app_long_card.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';

class BarChart extends StatefulWidget {
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
    this.countTotal,
    this.countTransaction,
    this.textDateRange,
    this.countTotalColor,
    required this.onTapItem,
  });

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                    selectedOption,
                    style: AppTextStyle.bodySmall(
                        fontWeight: AppFontWeight.semibold,
                        color: AppColors.blackLv5),
                  ),
                  borderWidth: 1,
                  onTap: () {
                    _showDateFilterBottomSheet(context);
                  }),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.textDateRange ?? '1 Jan 2023 - 31 Juli 2023',
                  style: AppTextStyle.regular(
                      size: 14, color: AppColors.blackLv4)),
              const SizedBox(height: AppSizes.padding / 2),
              Text(
                widget.countTotal ?? '1.000 Transaksi',
                style: AppTextStyle.heading4(color: AppColors.primary),
              ),
              const SizedBox(height: AppSizes.padding / 2),
              Text('Total Penjualan Link dan Kupon',
                  style: AppTextStyle.regular(
                      size: 14, color: AppColors.blackLv4)),
            ],
          ),
          const SizedBox(height: AppSizes.padding),
          widget.barChart,
          const SizedBox(
            height: AppSizes.padding * 2,
          ),
          const SizedBox(height: AppSizes.padding),
          widget.tagBar,
        ],
      ),
    );
  }

  String selectedOption = "6 Bulan";

  void _showDateFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      context: context,
      builder: (BuildContext context) {
        return AppModalReferral(
          selectedOption: selectedOption,
          onSelect: (value) {
            setState(() {
              selectedOption = value;
            });
          },
        );
      },
    );
  }
}