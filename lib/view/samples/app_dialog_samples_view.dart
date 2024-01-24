import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_dialog.dart';
import '___sample_wrapper.dart';

class AppDialogSamplesView extends StatefulWidget {
  const AppDialogSamplesView({super.key});

  static const routeName = '/molecule-app-dialog';

  @override
  State<AppDialogSamplesView> createState() => _AppDialogSamplesViewState();
}

class _AppDialogSamplesViewState extends State<AppDialogSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dialog Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dialogProgress(),
            errorDialog(),
            defaultDialog(),
            customDialog(),
          ],
        ),
      ),
    );
  }

  Widget dialogProgress() {
    return SampleWrapper(
      title: 'Dialog Progress',
      widget: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          AppDialog.showDialogProgress(navigator);
        },
        text: 'AppDialog.showDialogProgress(navigator)',
      ),
    );
  }

  Widget errorDialog() {
    return SampleWrapper(
      title: 'Error Dialog',
      widget: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          AppDialog.showErrorDialog(navigator, error: 'someError()');
        },
        text: 'AppDialog.showErrorDialog(navigator)',
      ),
    );
  }

  Widget defaultDialog() {
    return SampleWrapper(
      title: 'Default Dialog',
      widget: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          AppDialog.show(
            navigator,
            title: 'Dialog Title',
            text: 'Dialog Text',
            leftButtonText: 'Left Button',
            rightButtonText: 'Right Button',
          );
        },
        text: 'AppDialog.show(navigator)',
      ),
    );
  }

  Widget customDialog() {
    return SampleWrapper(
      title: 'Custom Dialog',
      widget: AppButton(
        onTap: () {
          final navigator = Navigator.of(context);
          AppDialog.show(
            navigator,
            child: Column(
              children: [
                Text(
                  'Custom Dialog',
                  style: AppTextStyle.heading4(),
                ),
                const SizedBox(height: AppSizes.padding / 2),
                Text(
                  'Lorem ipsum dolor sit amet set viatu',
                  style: AppTextStyle.semiBold(size: 12),
                ),
                const SizedBox(height: AppSizes.padding),
                AppButton(
                  text: 'Button',
                  onTap: () {},
                ),
                const SizedBox(height: AppSizes.padding / 2),
                AppButton(
                  text: 'Button',
                  onTap: () {},
                )
              ],
            ),
          );
        },
        text: 'AppDialog.show(navigator)',
      ),
    );
  }
}
