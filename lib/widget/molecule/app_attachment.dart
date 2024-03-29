import 'dart:io';

import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/utility/external_launcher.dart';
import 'package:alvamind_three_library_frontend/model/attachment_model.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_image.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_maps.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:open_filex/open_filex.dart';

import '../../model/location_model.dart';

class AppAttachment extends StatelessWidget {
  final AttachmentModel attachment;
  final double aspectRatio;
  final double? borderRadius;
  final EdgeInsets padding;

  const AppAttachment({
    super.key,
    required this.attachment,
    this.aspectRatio = 16 / 9,
    this.borderRadius,
    this.padding = const EdgeInsets.symmetric(vertical: AppSizes.padding / 2),
  });

  static String attachmentName(AttachmentModel? attachment) {
    if (attachment?.type == AttachmentType.image ||
        attachment?.type == AttachmentType.document ||
        attachment?.type == AttachmentType.video ||
        attachment?.type == AttachmentType.other) {
      String fullPath = (attachment?.value is File ? (attachment?.value as File).path : attachment?.value);
      String name = fullPath.split('/').lastOrNull?.split('.').firstOrNull ?? '';
      String type = fullPath.split('.').lastOrNull ?? '';

      return "${name.length > 20 ? name.replaceRange(name.length ~/ 6, name.length - 3, ".....") : name}.$type";
    }

    if (attachment?.type == AttachmentType.location) {
      return (attachment?.value as LocationModel).name;
    }

    return '';
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    if (attachment.value == null) {
      return const SizedBox.shrink();
    }

    if (attachment.type == AttachmentType.image) {
      return image(attachment);
    }

    if (attachment.type == AttachmentType.document ||
        attachment.type == AttachmentType.video ||
        attachment.type == AttachmentType.other) {
      return file(attachment);
    }

    if (attachment.type == AttachmentType.location) {
      return location(attachment);
    }

    return const SizedBox.shrink();
  }

  Widget image(AttachmentModel attachment) {
    return Padding(
      padding: padding,
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: AppImage(
          image: attachment.value,
          imgProvider: attachment.value.contains('http') ? ImgProvider.networkImage : ImgProvider.fileImage,
          borderRadius: borderRadius ?? AppSizes.radius * 2,
          backgroundColor: AppColors.blackLv9,
          enableFullScreenView: true,
        ),
      ),
    );
  }

  Widget file(AttachmentModel attachment) {
    return Padding(
      padding: padding,
      child: AppButton(
        prefixIconWidget: const Icon(
          AppIcons.document_text_default,
          color: AppColors.primary,
        ),
        prefixIconColor: AppColors.primary,
        text: attachmentName(attachment),
        fontSize: 14,
        textColor: AppColors.primary,
        center: false,
        padding: const EdgeInsets.all(AppSizes.padding / 2),
        rounded: false,
        buttonColor: AppColors.blueLv6,
        borderRadius: borderRadius ?? AppSizes.radius,
        onTap: () {
          if (attachment.value is File) {
            OpenFilex.open((attachment.value as File).path);
          } else {
            ExternalLauncher.openUrl(attachment.value);
          }
        },
      ),
    );
  }

  Widget location(AttachmentModel attachment) {
    return GestureDetector(
      onTap: () {
        ExternalLauncher.openMap(
          (attachment.value as LocationModel).latitude,
          (attachment.value as LocationModel).longitude,
        );
      },
      child: Container(
        padding: padding,
        color: AppColors.transparent,
        child: IgnorePointer(
          ignoring: true,
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? AppSizes.radius * 2),
              child: AppMaps(
                lat: (attachment.value as LocationModel).latitude,
                lng: (attachment.value as LocationModel).longitude,
                markers: {
                  Marker(
                    markerId: const MarkerId("id"),
                    position: LatLng(
                      (attachment.value as LocationModel).latitude,
                      (attachment.value as LocationModel).longitude,
                    ),
                  )
                },
                zoom: 13,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: false,
                padding: const EdgeInsets.all(AppSizes.padding / 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
