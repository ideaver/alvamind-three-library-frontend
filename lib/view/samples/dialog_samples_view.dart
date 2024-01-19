import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_dialog.dart';
import 'sample_wrapper.dart';

class DialogSamplesView extends StatefulWidget {
  const DialogSamplesView({super.key});

  static const routeName = '/molecule-app-dialog';

  @override
  State<DialogSamplesView> createState() => _DialogSamplesViewState();
}

class _DialogSamplesViewState extends State<DialogSamplesView> {
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
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            child: AppDialogCustomWidget(
              backgroundColor: AppColors.white,
              // image: AppAssets.info,
              title: 'Dialog',
              titleColor: AppColors.primary,
              subtitle: 'Lorem ipsum dolor sit amet hua qui lori ipsum sit ghui amet poety amet',
              subtitleColor: AppColors.black,
              onTapButton: () {
                // TODO
              },
              onTapSecondButton: () {
                // TODO
              },
            ),
          );
        },
        text: 'AppDialog.show(navigator)',
      ),
    );
  }
}
