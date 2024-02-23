import 'dart:io';

import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../molecule/app_button.dart';

class PickImageModalBody extends StatelessWidget {
  final String? title;
  final Function(File)? onTapGallery;
  final Function(File)? onTapCamera;
  final Function()? onTapDelete;

  const PickImageModalBody({
    super.key,
    this.title = 'Ambil Foto',
    this.onTapGallery,
    this.onTapCamera,
    this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: onTapGallery != null,
          child: pickButton(
            title: 'Pilih Foto',
            icon: Icons.photo_size_select_actual_outlined,
            color: AppColors.secondary,
            onTap: () {
              openCamera(context);
            },
          ),
        ),
        Visibility(
          visible: onTapCamera != null,
          child: pickButton(
            title: 'Ambil Foto',
            icon: Icons.camera_alt_outlined,
            color: AppColors.secondary,
            onTap: () {
              openGallery(context);
            },
          ),
        ),
        Visibility(
          visible: onTapDelete != null,
          child: pickButton(
            title: 'Hapus Foto',
            icon: Icons.delete_outline_rounded,
            color: AppColors.error,
            onTap: () {
              if (onTapDelete != null) {
                onTapDelete!();
              }
            },
          ),
        ),
      ],
    );
  }

  void openCamera(BuildContext context) async {
    final navigator = Navigator.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    onTapGallery!(File(image.path));
    navigator.pop();
  }

  void openGallery(BuildContext context) async {
    final navigator = Navigator.of(context);
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);

    if (image == null) {
      return;
    }

    onTapCamera!(File(image.path));
    navigator.pop();
  }

  Widget pickButton({
    required String title,
    required IconData icon,
    required Color color,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      child: AppButton(
        width: double.maxFinite,
        text: title,
        buttonColor: AppColors.white,
        textColor: color,
        borderWidth: 1,
        center: false,
        rounded: false,
        borderRadius: AppSizes.radius * 2,
        padding: const EdgeInsets.all(AppSizes.padding),
        fontWeight: AppFontWeight.medium,
        prefixIconWidget: Container(
          padding: const EdgeInsets.all(AppSizes.padding / 2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: AppColors.blackLv8),
          ),
          child: Icon(
            icon,
            size: 18,
            color: color,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
