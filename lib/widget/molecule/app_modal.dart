import 'app_button.dart';
import 'app_icon_button.dart';
import 'package:flutter/material.dart';
import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_sizes.dart';
import '../../../app/theme/app_text_style.dart';
import '../../app/theme/app_shadows.dart';

class AppModal {
  static Future<void> show({
    required BuildContext context,
    Widget? iconWidget,
    String? title,
    String? subtitle,
    EdgeInsets? padding,
    Color? backgroundColor,
    double? borderRadius,
    bool? isScrolled,
    bool? showCloseButton,
    Widget? body,
    CrossAxisAlignment? crossAxisAlignment,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return AppModalWidget(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius,
          iconWidget: iconWidget,
          padding: padding,
          subtitle: subtitle,
          showCloseButton: showCloseButton,
          title: title,
          body: body,
          crossAxisAlignment: crossAxisAlignment,
        );
      },
    );
  }

  static void pickImageModal({
    required BuildContext context,
    String? title = 'Ambil Foto',
    required Function() onTapGalleryButton,
    required Function() onTapCameraButton,
    required Function()? onTapDeleteButton,
  }) {
    AppModal.show(
      context: context,
      title: title,
      showCloseButton: true,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppButton(
            width: double.maxFinite,
            text: 'Pilih Foto',
            buttonColor: AppColors.white,
            textColor: AppColors.secondary,
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
              child: const Icon(
                Icons.photo_size_select_actual_outlined,
                size: 18,
                color: AppColors.secondary,
              ),
            ),
            onTap: onTapGalleryButton,
          ),
          const SizedBox(height: AppSizes.padding),
          AppButton(
            width: double.maxFinite,
            text: 'Ambil Foto',
            buttonColor: AppColors.white,
            textColor: AppColors.secondary,
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
              child: const Icon(
                Icons.camera_alt_outlined,
                size: 18,
                color: AppColors.secondary,
              ),
            ),
            onTap: onTapCameraButton,
          ),
          Visibility(
            visible: onTapDeleteButton != null,
            child: Padding(
              padding: const EdgeInsets.only(top: AppSizes.padding),
              child: AppButton(
                width: double.maxFinite,
                text: 'Hapus Foto',
                buttonColor: AppColors.white,
                textColor: AppColors.error,
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
                  child: const Icon(
                    Icons.delete_outline_rounded,
                    size: 18,
                    color: AppColors.error,
                  ),
                ),
                onTap: onTapCameraButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppModalWidget extends StatefulWidget {
  final Widget? iconWidget;
  final String? title;
  final String? subtitle;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final double? borderRadius;
  final bool? showCloseButton;
  final Widget? body;
  final CrossAxisAlignment? crossAxisAlignment;

  const AppModalWidget({
    super.key,
    this.backgroundColor,
    this.borderRadius,
    this.iconWidget,
    this.padding,
    this.subtitle,
    this.showCloseButton,
    this.title,
    this.body,
    this.crossAxisAlignment,
  });

  @override
  State<AppModalWidget> createState() => _AppModalWidgetState();
}

class _AppModalWidgetState extends State<AppModalWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          closeButton(),
          Container(
            decoration: BoxDecoration(
              color: widget.backgroundColor ?? AppColors.white,
              boxShadow: [AppShadows.darkShadow4Reversed],
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.circular(widget.borderRadius ?? AppSizes.radius * 2),
                topRight:
                    Radius.circular(widget.borderRadius ?? AppSizes.radius * 2),
              ),
            ),
            child: Padding(
              padding: widget.padding ?? const EdgeInsets.all(AppSizes.padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    widget.crossAxisAlignment ?? CrossAxisAlignment.start,
                children: [
                  widget.iconWidget != null
                      ? widget.iconWidget!
                      : const SizedBox.shrink(),
                  widget.title != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: AppSizes.padding / 2),
                          child: Text(
                            widget.title!,
                            style: AppTextStyle.heading5(
                                color: AppColors.secondary),
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.subtitle != null
                      ? Padding(
                          padding:
                              const EdgeInsets.only(top: AppSizes.padding / 4),
                          child: Text(
                            widget.subtitle!,
                            style: AppTextStyle.medium(
                                size: 12, color: AppColors.blackLv5),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(top: AppSizes.padding),
                    child: widget.body != null
                        ? widget.body!
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget closeButton() {
    return Visibility(
      visible: widget.showCloseButton ?? false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.padding),
        child: AppIconButton(
          iconButtonColor: AppColors.white,
          icon: const Icon(
            Icons.close,
            color: AppColors.secondary,
            size: 24,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
