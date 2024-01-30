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
    Widget? body,
  }) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparent,
      builder: (context) {
        return AppModalWidget(
          backgroundColor: backgroundColor,
          borderRadius: borderRadius ?? AppSizes.radius,
          iconWidget: iconWidget,
          padding: const EdgeInsets.all(AppSizes.padding),
          subtitle: subtitle,
          isScrolled: false,
          title: title,
          body: body,
        );
      },
    );
  }

  static void pickImageModal({
    required BuildContext context,
    required Function() onTapGalleryButton,
    required Function() onTapCameraButton,
  }) {
    AppModal.show(
      context: context,
    );
  }
}

class AppModalWidget extends StatefulWidget {
  final Widget? iconWidget;
  final String? title;
  final String? subtitle;
  final EdgeInsets padding;
  final Color? backgroundColor;
  final double borderRadius;
  final bool isScrolled;
  final Widget? body;
  final CrossAxisAlignment crossAxisAlignment;

  const AppModalWidget({
    super.key,
    this.backgroundColor = AppColors.white,
    this.borderRadius = AppSizes.radius * 2,
    this.iconWidget,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.subtitle,
    this.isScrolled = false,
    this.title,
    this.body,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  State<AppModalWidget> createState() => _AppModalWidgetState();
}

class _AppModalWidgetState extends State<AppModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: [AppShadows.darkShadow4Reversed],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.borderRadius),
          topRight: Radius.circular(widget.borderRadius),
        ),
      ),
      child: Padding(
        padding: widget.padding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: [
            widget.iconWidget != null ? widget.iconWidget! : const SizedBox.shrink(),
            widget.title != null
                ? Padding(
                    padding: const EdgeInsets.only(top: AppSizes.padding / 2),
                    child: Text(
                      widget.title!,
                      style: AppTextStyle.heading5(),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.title != null
                ? Padding(
                    padding: const EdgeInsets.only(top: AppSizes.padding / 4, bottom: AppSizes.padding),
                    child: Text(
                      widget.subtitle!,
                      style: AppTextStyle.medium(size: 12, color: AppColors.blackLv5),
                    ),
                  )
                : const SizedBox.shrink(),
            widget.body != null
                ? widget.isScrolled
                    ? Flexible(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          child: widget.body!,
                        ),
                      )
                    : widget.body!
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
