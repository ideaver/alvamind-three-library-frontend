import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_snackbar.dart';
import '___sample_wrapper.dart';

class AppSnackbarSamplesView extends StatefulWidget {
  const AppSnackbarSamplesView({super.key});

  static const routeName = '/molecule-app-snackbar';

  @override
  State<AppSnackbarSamplesView> createState() => _AppSnackbarSamplesViewState();
}

class _AppSnackbarSamplesViewState extends State<AppSnackbarSamplesView> {
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
            defaultSnackbarWidget(),
            alertSnackbarWidget(),
            customSnackbarWidget(),
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
          AppSnackbar.show(context, title: 'Snackbar Title');
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
          AppSnackbar.show(
            context,
            icon: Icons.info_outline,
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
          AppSnackbar.show(
            context,
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

  Widget defaultSnackbarWidget() {
    return const SampleWrapper(
      title: 'Default Snackbar Widget',
      widget: AppSnackbarWidget(
        title: 'Snackbar Title',
      ),
    );
  }

  Widget alertSnackbarWidget() {
    return const SampleWrapper(
      title: 'Alert Snackbar Widget',
      widget: AppSnackbarWidget(
        icon: Icons.info_outline,
        title: 'Snackbar Title',
        backgroundColor: AppColors.redLv1,
        showCloseButton: true,
      ),
    );
  }

  Widget customSnackbarWidget() {
    return const SampleWrapper(
      title: 'Alert Snackbar Widget',
      widget: AppSnackbarWidget(
        icon: Icons.person_2_rounded,
        iconSize: 32,
        backgroundColor: AppColors.orangeLv1,
        title: 'Snackbar Title',
        subtitle: 'Snackbar Subtitle',
        showCloseButton: true,
      ),
    );
  }
}
