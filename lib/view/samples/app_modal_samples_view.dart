import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/view/samples/___sample_wrapper.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_text_field.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_modal.dart';

class AppModalPopupButtonSamplesView extends StatefulWidget {
  const AppModalPopupButtonSamplesView({super.key});

  static const routeName = '/organism-modal';

  @override
  State<AppModalPopupButtonSamplesView> createState() => _AppModalPopupButtonSamplesViewState();
}

class _AppModalPopupButtonSamplesViewState extends State<AppModalPopupButtonSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLv9,
      appBar: AppBar(title: const Text('Modal Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultModal(),
            customModal(),
          ],
        ),
      ),
    );
  }

  Widget defaultModal() {
    return SampleWrapper(
      title: 'Default Modal',
      widget: AppButton(
        text: 'Show Default Modal',
        onTap: () {
          AppModal.show(
            context: context,
            iconWidget: const Icon(
              Icons.check_circle,
              color: AppColors.greenLv2,
              size: 40,
            ),
            title: 'Title',
            subtitle: 'Subtitle',
            body: Column(
              children: [
                AppButton(
                  text: 'Button',
                  onTap: () {},
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget customModal() {
    return SampleWrapper(
      title: 'Custom Modal',
      widget: AppButton(
        text: 'Show Custom Modal',
        onTap: () {
          AppModal.show(
            context: context,
            title: 'Masukkan Nominal',
            body: Column(
              children: [
                const AppTextField(
                  type: AppTextFieldType.currency,
                ),
                const SizedBox(height: AppSizes.padding),
                AppButton(
                  text: 'Terapkan',
                  onTap: () {},
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
