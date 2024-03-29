import 'package:flutter/material.dart';

import '../../app/const/countries.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/country_model.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/atom/app_tool_tip.dart';
import '___sample_wrapper.dart';

class AppToolTipMenuSamples extends StatefulWidget {
  const AppToolTipMenuSamples({super.key});

  static const routeName = '/atom-app-tool-tip-menu';

  @override
  State<AppToolTipMenuSamples> createState() => _AppToolTipMenuSamplesState();
}

class _AppToolTipMenuSamplesState extends State<AppToolTipMenuSamples> {
  CountryModel _country = countries.first;
  CountryModel _country2 = countries.first;
  CountryModel _country3 = countries.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tool Tip Menu Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultToolTip(),
            toolTipCustomStyle(),
            customChildToolTip(),
          ],
        ),
      ),
    );
  }

  Widget defaultToolTip() {
    return SampleWrapper(
      title: 'Default Tool Tip Menu',
      widget: AppToolTipMenu(
        onTapItem: (i) {
          _country = countries[i];
          setState(() {});
        },
        title: _country.name,
        padding: EdgeInsets.zero,
        children: List.generate(countries.length, (i) {
          return Text(
            countries[i].name,
            style: AppTextStyle.semiBold(size: 12),
          );
        }),
      ),
    );
  }

  Widget toolTipCustomStyle() {
    return SampleWrapper(
      title: 'Tool Tip Menu Custom Style',
      widget: AppToolTipMenu(
        onTapItem: (i) {
          _country2 = countries[i];
          setState(() {});
        },
        title: _country2.name,
        width: 100,
        elevation: 0,
        backgroundColor: AppColors.blueLv5,
        iconColor: AppColors.primary,
        titleColor: AppColors.primary,
        borderWidth: 1,
        borderColor: AppColors.blueLv2,
        borderRadius: 100,
        children: List.generate(countries.length, (i) {
          return Text(
            countries[i].name,
            style: AppTextStyle.semiBold(size: 12),
          );
        }),
      ),
    );
  }

  Widget customChildToolTip() {
    return SampleWrapper(
      title: 'Custom Child Tool Tip Menu',
      widget: AppToolTipMenu(
        onTapItem: (i) {
          _country3 = countries[i];
          setState(() {});
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              child: AppImage(
                image: _country3.flag,
                imgProvider: ImgProvider.assetImage,
                // Remove this if the widget called from another project
                isFromAppAssets: false,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.blackLv1,
              size: 24,
            ),
            const SizedBox(width: 4),
            Text(
              _country3.phoneCode,
              style: AppTextStyle.bodyMedium(
                fontWeight: AppFontWeight.semibold,
              ),
            )
          ],
        ),
        children: List.generate(countries.length, (i) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 24,
                child: AppImage(
                  image: countries[i].flag,
                  imgProvider: ImgProvider.assetImage,
                  // Remove this if the widget called from another project
                  isFromAppAssets: false,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                countries[i].phoneCode,
                style: AppTextStyle.semiBold(size: 12),
              )
            ],
          );
        }),
      ),
    );
  }
}
