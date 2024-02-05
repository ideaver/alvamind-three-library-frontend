import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/molecule/app_button.dart';
import '../../widget/molecule/app_modal.dart';
import '../../widget/molecule/app_text_field.dart';
import '___sample_wrapper.dart';

class AppModalPopupButtonSamplesView extends StatefulWidget {
  const AppModalPopupButtonSamplesView({super.key});

  static const routeName = '/molecule-app-modal';

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
            defaultModalWithIconWidgetAndBody(),
            customModal(),
            customModalWithCloseButton(),
            defaultPickImageDialog(),
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
            body: AppButton(
              text: 'Button',
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  Widget defaultModalWithIconWidgetAndBody() {
    return SampleWrapper(
      title: 'Default Modal With Icon Widget & Body',
      widget: AppButton(
        text: 'Show Default Modal With Icon Widget & Body',
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
            body: AppButton(
              text: 'Button',
              onTap: () {},
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
            iconWidget: const Icon(
              Icons.check_circle,
              color: AppColors.greenLv2,
              size: 40,
            ),
            title: 'Title',
            subtitle: 'Description here',
            body: Column(
              children: [
                const AppTextField(
                  type: AppTextFieldType.currency,
                ),
                const SizedBox(height: AppSizes.padding),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Button',
                        buttonColor: AppColors.white,
                        textColor: AppColors.secondary,
                        borderWidth: 1,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: AppSizes.padding),
                    Expanded(
                      child: AppButton(
                        text: 'Button',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget customModalWithCloseButton() {
    return SampleWrapper(
      title: 'Custom Modal With Close Button',
      widget: AppButton(
        text: 'Show Custom Modal With Close Button',
        onTap: () {
          AppModal.show(
            context: context,
            iconWidget: const Icon(
              Icons.check_circle,
              color: AppColors.greenLv2,
              size: 40,
            ),
            title: 'Title',
            subtitle: 'Description here',
            showCloseButton: true,
            body: Column(
              children: [
                const AppTextField(
                  labelText: 'Label',
                  hintText: 'Hint',
                  type: AppTextFieldType.currency,
                ),
                const SizedBox(height: AppSizes.padding),
                const AppTextField(
                  labelText: 'Label',
                  hintText: 'Hint',
                  type: AppTextFieldType.number,
                ),
                const SizedBox(height: AppSizes.padding),
                const AppTextField(
                  labelText: 'Label',
                  hintText: 'Hint',
                  type: AppTextFieldType.text,
                ),
                const SizedBox(height: AppSizes.padding),
                const AppTextField(
                  labelText: 'Label',
                  hintText: 'Hint',
                  type: AppTextFieldType.text,
                  minLines: 3,
                ),
                const SizedBox(height: AppSizes.padding),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Button',
                        buttonColor: AppColors.white,
                        textColor: AppColors.secondary,
                        borderWidth: 1,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: AppSizes.padding),
                    Expanded(
                      child: AppButton(
                        text: 'Button',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget defaultPickImageDialog() {
    return SampleWrapper(
      title: 'Default Pick Image Dialog',
      widget: AppButton(
        text: 'Show Default Pick Image Dialog',
        onTap: () {
          AppModal.pickImageModal(
            context: context,
            title: 'Edit Foto Profil',
            onTapCameraButton: () {},
            onTapGalleryButton: () {},
            // Optional
            onTapDeleteButton: () {},
          );
        },
      ),
    );
  }
}
