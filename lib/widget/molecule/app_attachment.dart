import 'dart:io';

import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/model/attachment_model.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_image.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_maps.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';

class AppAttachment extends StatefulWidget {
  final AttachmentModel attachment;
  final double aspectRatio;
  final double? borderRadius;

  const AppAttachment({
    super.key,
    required this.attachment,
    this.aspectRatio = 16 / 9,
    this.borderRadius,
  });

  @override
  State<AppAttachment> createState() => _AppAttachmentState();
}

class _AppAttachmentState extends State<AppAttachment> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    if (widget.attachment.value == null) {
      return const SizedBox.shrink();
    }

    if (widget.attachment.type == AttachmentType.image) {
      return image(widget.attachment);
    }

    if (widget.attachment.type == AttachmentType.document) {
      return document(widget.attachment);
    }

    if (widget.attachment.type == AttachmentType.location) {
      return location(widget.attachment);
    }

    if (widget.attachment.type == AttachmentType.other) {
      return other(widget.attachment);
    }

    return const SizedBox.shrink();
  }

  Widget image(AttachmentModel attachment) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: AppImage(
        image: attachment.value,
        imgProvider: attachment.value.contains('http') ? ImgProvider.networkImage : ImgProvider.fileImage,
        borderRadius: widget.borderRadius ?? AppSizes.radius * 2,
        backgroundColor: AppColors.blackLv9,
        enableFullScreenView: true,
      ),
    );
  }

  Widget document(AttachmentModel attachment) {
    return AppButton(
      prefixIconWidget: const Icon(
        AppIcons.document_text_default,
        color: AppColors.primary,
      ),
      prefixIconColor: AppColors.primary,
      text: (attachment.value as String).split('/').last,
      fontSize: 14,
      textColor: AppColors.primary,
      center: false,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
      rounded: false,
      buttonColor: AppColors.blueLv6,
      borderRadius: widget.borderRadius ?? AppSizes.radius,
      onTap: () {
        if (attachment.value is File) {
          OpenFilex.open((attachment.value as File).path);
        } else {
          // TODO DOWNLOAD AND OPEN FILE
        }
      },
    );
  }

  Widget location(AttachmentModel attachment) {
    return GestureDetector(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: widget.aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? AppSizes.radius * 2),
          child: AppMaps(
            lat: double.parse((attachment.value as String).split(',').firstOrNull ?? '0'),
            lng: double.parse((attachment.value as String).split(',').lastOrNull ?? '0'),
            zoomControlsEnabled: false,
            padding: const EdgeInsets.all(AppSizes.padding / 2),
          ),
        ),
      ),
    );
  }

  Widget other(AttachmentModel attachment) {
    return AppButton(
      prefixIconWidget: const Icon(
        Icons.insert_drive_file_outlined,
        color: AppColors.primary,
      ),
      prefixIconColor: AppColors.primary,
      text: (attachment.value as String).split('/').last,
      fontSize: 14,
      textColor: AppColors.primary,
      center: false,
      padding: const EdgeInsets.all(AppSizes.padding / 2),
      rounded: false,
      buttonColor: AppColors.blueLv6,
      borderRadius: widget.borderRadius ?? AppSizes.radius,
      onTap: () {
        if (attachment.value is File) {
          OpenFilex.open((attachment.value as File).path);
        } else {
          // TODO DOWNLOAD AND OPEN FILE
        }
      },
    );
  }
}
