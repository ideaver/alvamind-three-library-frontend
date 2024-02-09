import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import 'app_radio_list_tile.dart';

class AppModalReferral extends StatefulWidget {
  final String selectedOption;
  final Function(String) onSelect;

  AppModalReferral({
    required this.selectedOption,
    required this.onSelect,
  });

  @override
  _AppModalReferralState createState() => _AppModalReferralState();
}

class _AppModalReferralState extends State<AppModalReferral> {
  late String selectedOption;

  @override
  void initState() {
    super.initState();
    selectedOption = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          AppIconButton(
              icon: const Icon(
                Icons.close,
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Pilih Tanggal',
                      style: AppTextStyle.heading5(),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppRadioListTile(
                      title: "Hari Ini",
                      subtitle: '6 Jan 2024',
                      value: "Hari Ini",
                      subtitleStyle: AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.regular,
                          color: AppColors.blackLv5),
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppRadioListTile(
                      title: "7 Hari Terakhir",
                      subtitle: '30 Des 2023 - 6 Jan 2024',
                      titleStyle: AppTextStyle.bodyMedium(
                          fontWeight: AppFontWeight.bold),
                      subtitleStyle: AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.regular,
                          color: AppColors.blackLv5),
                      value: "7 Hari",
                      groupValue: selectedOption,
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppRadioListTile(
                      title: "6 Bulan Terakhir",
                      subtitle: '6 Des 2023 - 6 Jan 2023',
                      value: "6 Bulan",
                      groupValue: selectedOption,
                      subtitleStyle: AppTextStyle.bodySmall(
                          fontWeight: AppFontWeight.regular,
                          color: AppColors.blackLv5),
                      onChanged: (value) {
                        setState(() {
                          selectedOption = value.toString();
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppButton(
                      onTap: () {
                        widget.onSelect(selectedOption);
                        Navigator.pop(context);
                      },
                      text: 'Terapkan',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
