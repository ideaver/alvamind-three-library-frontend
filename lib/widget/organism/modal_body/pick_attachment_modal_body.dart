import 'dart:io';

import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/model/location_model.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_snackbar.dart';
import 'package:alvamind_three_library_frontend/widget/organism/maps/maps_address_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../model/attachment_model.dart';

class PickAttachmentModalBody extends StatelessWidget {
  final String? title;
  final String subtitle;
  final int maxFileSize;
  final Function(AttachmentModel)? onTapCamera;
  final Function(AttachmentModel)? onTapGallery;
  final Function(AttachmentModel)? onTapDocument;
  final Function(AttachmentModel)? onTapLocation;

  const PickAttachmentModalBody({
    super.key,
    this.title = 'Attachment',
    this.maxFileSize = 5000000,
    this.subtitle = 'Image/file must be less than 5 MB',
    this.onTapCamera,
    this.onTapGallery,
    this.onTapDocument,
    this.onTapLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Attachment',
          style: AppTextStyle.heading5(),
        ),
        const SizedBox(height: AppSizes.padding / 2),
        Visibility(
          visible: subtitle != '',
          child: Padding(
            padding: const EdgeInsets.only(top: AppSizes.padding / 2),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.blackLv5,
                  size: 16,
                ),
                const SizedBox(width: AppSizes.padding / 2),
                Text(
                  subtitle,
                  style: AppTextStyle.bodyMedium(
                    fontWeight: AppFontWeight.regular,
                    color: AppColors.blackLv5,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Visibility(
                visible: onTapCamera != null,
                child: attachButton(
                  icon: Icons.camera_alt_outlined,
                  name: "Camera",
                  onTap: () async {
                    openCamera(context);
                  },
                ),
              ),
              Visibility(
                visible: onTapGallery != null,
                child: attachButton(
                  icon: Icons.image_outlined,
                  name: "Gallery",
                  onTap: () {
                    openGallery(context);
                  },
                ),
              ),
              Visibility(
                visible: onTapDocument != null,
                child: attachButton(
                  icon: Icons.description_outlined,
                  name: "Document",
                  onTap: () {
                    openFiles(context);
                  },
                ),
              ),
              Visibility(
                visible: onTapLocation != null,
                child: attachButton(
                  icon: Icons.location_on_outlined,
                  name: "Location",
                  onTap: () {
                    openMaps(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void openCamera(BuildContext context) async {
    final navigator = Navigator.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }

    if (await image.length() > maxFileSize) {
      AppSnackbar.show(
        navigator,
        title: subtitle,
        backgroundColor: AppColors.error,
        showCloseButton: true,
      );
      return;
    }

    AttachmentModel attach = AttachmentModel(
      type: AttachmentType.image,
      value: File(image.path),
    );

    onTapCamera!(attach);
    navigator.pop();
  }

  void openGallery(BuildContext context) async {
    final navigator = Navigator.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    if (await image.length() > maxFileSize) {
      AppSnackbar.show(
        navigator,
        title: subtitle,
        backgroundColor: AppColors.error,
        showCloseButton: true,
      );
      return;
    }

    AttachmentModel attach = AttachmentModel(
      type: AttachmentType.image,
      value: File(image.path),
    );

    onTapGallery!(attach);
    navigator.pop();
  }

  void openFiles(BuildContext context) async {
    final navigator = Navigator.of(context);

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result == null) {
      return;
    }

    if (result.files.first.size > maxFileSize) {
      AppSnackbar.show(
        navigator,
        title: subtitle,
        backgroundColor: AppColors.error,
        showCloseButton: true,
      );
      return;
    }

    AttachmentModel attach = AttachmentModel(
      type: AttachmentType.other,
      value: File(result.files.first.path!),
    );

    onTapDocument!(attach);
    navigator.pop();
  }

  void openMaps(BuildContext context) async {
    final navigator = Navigator.of(context);

    LocationModel value = await navigator.push(
      MaterialPageRoute(
        builder: (context) => const MapsAddressPicker(),
      ),
    );

    AttachmentModel attach = AttachmentModel(
      type: AttachmentType.location,
      value: value,
    );

    onTapLocation!(attach);
    navigator.pop();
  }

  Widget attachButton({
    required IconData icon,
    required String name,
    required Function() onTap,
  }) {
    return AppIconButton(
      iconButtonColor: AppColors.transparent,
      icon: Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          color: AppColors.blueLv6,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: AppColors.primary,
        ),
      ),
      width: 80,
      maxLines: 1,
      text: name,
      textStyle: AppTextStyle.bodyXSmall(fontWeight: AppFontWeight.medium),
      onTap: onTap,
    );
  }
}
