import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_tab_button_group.dart';
import 'package:flutter/material.dart';

class AppTabButton extends StatefulWidget {
  const AppTabButton({super.key});
  static const routeName = '/molecule-app-tab-button';

  @override
  State<AppTabButton> createState() => _AppTabButtonState();
}

class _AppTabButtonState extends State<AppTabButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab Button Samples')),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            AppTabButtonGroup(
              options: ['Transaksi', 'Referral'],
              pages: [
                Text('Transaksi'),
                Text('Referral'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
