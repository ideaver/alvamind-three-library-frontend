import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_snackbar.dart';
import 'sample_wrapper.dart';

class SnackbarSamplesView extends StatefulWidget {
  const SnackbarSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-snackbar-samples';

  @override
  State<SnackbarSamplesView> createState() => _SnackbarSamplesViewState();
}

class _SnackbarSamplesViewState extends State<SnackbarSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLv9,
      appBar: AppBar(title: const Text('Snackbar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultSnackbar(),
            alertSnackbar(),
            customSnackbar(),
          ],
        ),
      ),
    );
  }

  Widget defaultSnackbar() {
    return SampleWrapper(
      title: 'Default Snackbar',
      widget: AppButton(
        text: 'Default Snackbar',
        onTap: () {
          final navigator = Navigator.of(context);
          AppSnackbar.show(navigator, title: 'Snackbar Title');
        },
      ),
    );
  }

  Widget alertSnackbar() {
    return SampleWrapper(
      title: 'Alert Snackbar',
      widget: AppButton(
        text: 'Alert Snackbar',
        onTap: () {
          final navigator = Navigator.of(context);
          AppSnackbar.show(
            navigator,
            icon: Icons.info,
            title: 'Snackbar Alert',
            backgroundColor: AppColors.redLv1,
            showCloseButton: true,
          );
        },
      ),
    );
  }

  Widget customSnackbar() {
    return SampleWrapper(
      title: 'Custom Snackbar',
      widget: AppButton(
        text: 'Custom Snackbar',
        onTap: () {
          final navigator = Navigator.of(context);
          AppSnackbar.show(
            navigator,
            icon: Icons.person_2_rounded,
            iconSize: 32,
            backgroundColor: AppColors.orangeLv1,
            title: 'Snackbar Custom',
            subtitle: 'Snackbar Subtitle',
            showCloseButton: true,
          );
        },
      ),
    );
  }
}
