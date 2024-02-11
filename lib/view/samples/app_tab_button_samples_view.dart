import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_sorting_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_tab_button_group.dart';
import 'package:flutter/material.dart';

class AppTabButtonSamplesView extends StatefulWidget {
  const AppTabButtonSamplesView({super.key});
  static const routeName = '/molecule-app-tab-button';

  @override
  State<AppTabButtonSamplesView> createState() =>
      _AppTabButtonSamplesViewState();
}

class _AppTabButtonSamplesViewState extends State<AppTabButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Button Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tab Button',
              style: AppTextStyle.heading5(),
            ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            const AppTabButtonGroup(
              options: ['Transaksi', 'Referral'],
              pages: [
                Text('Page 1'),
                Text('Page 2'),
              ],
            ),
            const SizedBox(
              height: AppSizes.padding * 2,
            ),
            Text(
              'Sorting Button',
              style: AppTextStyle.heading5(),
            ),
            const SizedBox(
              height: AppSizes.padding / 2,
            ),
            AppSortingButton(
              onTapFirst: () {},
              onTapSecond: () {},
              firstText: 'Filter',
              secondText: 'Urutkan',
              firstIcon: AppIcons.Filter,
              secondIcon: Icons.sort,
            )
          ],
        ),
      ),
    );
  }
}
