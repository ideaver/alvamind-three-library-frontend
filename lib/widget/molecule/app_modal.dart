import 'dart:io';

import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_shadows.dart';
import '../../model/attachment_model.dart';
import '../../model/date_sorting_model.dart';
import '../organism/modal_body/pick_attachment_modal_body.dart';
import '../organism/modal_body/pick_date_sorting_modal_body.dart';
import '../organism/modal_body/pick_image_modal_body.dart';

class AppModal {
  static Future<dynamic> show({
    required BuildContext context,
    Widget? iconWidget,
    String? title,
    String? subtitle,
    EdgeInsets? padding,
    Color? backgroundColor,
    double? borderRadius,
    bool? isScrolled,
    bool? showCloseButton,
    bool isDismissible = true,
    Widget? body,
    CrossAxisAlignment? crossAxisAlignment,
    Color barrierColor = Colors.black54,
  }) async {
    return showModalBottomSheet(
      barrierColor: barrierColor,
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      isDismissible: isDismissible,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return SafeArea(
          child: GestureDetector(
            onTap: () {
              if (isDismissible) {
                Navigator.pop(context);
              }
            },
            child: Scaffold(
              extendBody: false,
              backgroundColor: AppColors.transparent,
              body: Align(
                alignment: Alignment.bottomCenter,
                child: AppModalWidget(
                  backgroundColor: backgroundColor,
                  borderRadius: borderRadius,
                  iconWidget: iconWidget,
                  padding: padding,
                  subtitle: subtitle,
                  showCloseButton: showCloseButton,
                  title: title,
                  body: body,
                  crossAxisAlignment: crossAxisAlignment,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void pickImageModal({
    required BuildContext context,
    String? title,
    Function(File)? onTapGallery,
    Function(File)? onTapCamera,
    Function()? onTapDelete,
  }) {
    AppModal.show(
      context: context,
      title: title,
      showCloseButton: true,
      body: PickImageModalBody(
        title: title,
        onTapGallery: onTapGallery,
        onTapCamera: onTapCamera,
        onTapDelete: onTapDelete,
      ),
    );
  }

  static void pickAttachmentModal({
    required BuildContext context,
    String? title,
    String? subtitle,
    int? maxFileSize,
    Function(AttachmentModel)? onTapCamera,
    Function(AttachmentModel)? onTapGallery,
    Function(AttachmentModel)? onTapDocument,
    Function(AttachmentModel)? onTapLocation,
  }) {
    AppModal.show(
      context: context,
      title: title,
      showCloseButton: true,
      body: PickAttachmentModalBody(
        title: title,
        subtitle: subtitle ?? '',
        maxFileSize: maxFileSize ?? 5000000,
        onTapCamera: onTapCamera,
        onTapGallery: onTapGallery,
        onTapDocument: onTapDocument,
        onTapLocation: onTapLocation,
      ),
    );
  }

  static void pickDateSortingModal({
    required BuildContext context,
    String? title,
    DateSortingModel? initialOption,
    List<DateSortingModel> specifiedDateRanges = const [
      DateSortingModel(count: 1, title: 'Hari Ini'),
      DateSortingModel(count: 7, title: '7  Hari Terakhir'),
      DateSortingModel(count: 30, title: '30  Hari Terakhir'),
    ],
    bool enableCustomDateRange = false,
    required Function(List<DateTime>, DateSortingModel?) onTapApply,
  }) {
    AppModal.show(
      context: context,
      title: title,
      showCloseButton: true,
      body: PickDateSortingModalBody(
        initialOption: initialOption,
        specifiedDateRanges: specifiedDateRanges,
        enableCustomDateRange: enableCustomDateRange,
        onTapApply: onTapApply,
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
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom, top: AppBar().preferredSize.height),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            closeButton(),
            Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? AppColors.white,
                boxShadow: [AppShadows.darkShadow4Reversed],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(widget.borderRadius ?? AppSizes.radius * 2),
                  topRight: Radius.circular(widget.borderRadius ?? AppSizes.radius * 2),
                ),
              ),
              child: Padding(
                padding: widget.padding ?? const EdgeInsets.all(AppSizes.padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: widget.crossAxisAlignment ?? CrossAxisAlignment.start,
                  children: [
                    widget.iconWidget != null ? widget.iconWidget! : const SizedBox.shrink(),
                    widget.title != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: AppSizes.padding / 2),
                            child: Text(
                              widget.title!,
                              style: AppTextStyle.heading5(color: AppColors.secondary),
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.subtitle != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: AppSizes.padding / 4),
                            child: Text(
                              widget.subtitle!,
                              style: AppTextStyle.medium(size: 12, color: AppColors.blackLv5),
                            ),
                          )
                        : const SizedBox.shrink(),
                    Padding(
                      padding: const EdgeInsets.only(top: AppSizes.padding),
                      child: widget.body != null ? widget.body! : const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
