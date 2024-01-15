import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../atom/app_image.dart';
import '../atom/app_progress_indicator.dart';
import 'app_button.dart';

class AppDialog {
  static Future<void> show(
    NavigatorState navigator, {
    String? title,
    Widget? child,
    String? text,
    EdgeInsetsGeometry? padding,
    String? leftButtonText,
    String? rightButtonText,
    Color? backgroundColor,
    Function()? onTapLeftButton,
    Function()? onTapRightButton,
    bool? dismissible,
    bool? showButtons,
    bool? enableRightButton,
    bool? enableLeftButton,
    Color? leftButtonTextColor,
    Color? rightButtonTextColor,
    double? elevation,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          title: title,
          text: text,
          padding: padding,
          rightButtonText: rightButtonText,
          leftButtonText: leftButtonText,
          backgroundColor: backgroundColor ?? AppColors.white,
          onTapLeftButton: onTapLeftButton,
          onTapRightButton: onTapRightButton,
          dismissible: dismissible ?? true,
          showButtons: showButtons ?? true,
          enableRightButton: enableRightButton ?? true,
          enableLeftButton: enableLeftButton ?? true,
          leftButtonTextColor: leftButtonTextColor ?? AppColors.blackLv1,
          rightButtonTextColor: rightButtonTextColor ?? AppColors.primary,
          elevation: elevation,
          child: child,
        );
      },
    );
  }

  static Future<void> showErrorDialog(
    NavigatorState navigator, {
    String? title,
    String? message,
    String? error,
  }) async {
    showDialog(
      context: navigator.context,
      barrierDismissible: false,
      builder: (context) {
        return AppDialogWidget(
          title: title ?? 'Oops!',
          child: Column(
            children: [
              Text(
                message ?? 'Something went wrong, please contact your system administrator or try restart the app',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMedium(
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                error.toString().length > 35 ? error.toString().substring(0, 15) : error.toString(),
                textAlign: TextAlign.center,
                style: AppTextStyle.bodySmall(
                  fontWeight: AppFontWeight.bold,
                  color: AppColors.blackLv6,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Future<void> showDialogProgress(
    NavigatorState navigator, {
    bool dismissible = false,
  }) async {
    showDialog(
      context: navigator.context,
      builder: (context) {
        return AppDialogWidget(
          dismissible: kDebugMode ? true : dismissible,
          backgroundColor: Colors.transparent,
          elevation: 0,
          showButtons: false,
          child: const AppProgressIndicator(
            color: Colors.white,
            textColor: Colors.white,
          ),
        );
      },
    );
  }
}

// Default Dialog
class AppDialogWidget extends StatelessWidget {
  final String? title;
  final Widget? child;
  final String? text;
  final EdgeInsetsGeometry? padding;
  final String? leftButtonText;
  final String? rightButtonText;
  final Color backgroundColor;
  final bool dismissible;
  final bool showButtons;
  final bool enableRightButton;
  final bool enableLeftButton;
  final Color leftButtonTextColor;
  final Color rightButtonTextColor;
  final double? elevation;
  final Function()? onTapLeftButton;
  final Function()? onTapRightButton;

  const AppDialogWidget({
    Key? key,
    this.title,
    this.child,
    this.text,
    this.padding,
    this.rightButtonText = 'Close',
    this.leftButtonText,
    this.backgroundColor = AppColors.white,
    this.onTapLeftButton,
    this.onTapRightButton,
    this.dismissible = true,
    this.showButtons = true,
    this.enableRightButton = true,
    this.enableLeftButton = true,
    this.leftButtonTextColor = AppColors.blackLv1,
    this.rightButtonTextColor = AppColors.primary,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(dismissible),
      child: Dialog(
        elevation: elevation,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 512),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                dialogTitle(),
                dialogBody(),
                dialogButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dialogTitle() {
    return title != null
        ? Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(
                //     width: 0.5,
                //     color: AppColors.blackLv12,
                //   ),
                // ),
                ),
            child: Text(
              title!,
              textAlign: TextAlign.center,
              style: AppTextStyle.heading6(),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget dialogBody() {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 10,
          ),
      alignment: Alignment.center,
      child: text != null
          ? Text(
              text!,
              textAlign: TextAlign.center,
              style: AppTextStyle.bodyMedium(fontWeight: AppFontWeight.medium),
            )
          : child ?? const SizedBox.shrink(),
    );
  }

  Widget dialogButtons(BuildContext context) {
    return !showButtons
        ? const SizedBox.shrink()
        : Container(
            decoration: const BoxDecoration(
                // border: Border(
                //   top: BorderSide(
                //     width: 0.5,
                //     color: AppColors.blackLv13,
                //   ),
                // ),
                ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: <Widget>[
                  leftButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: leftButtonText!,
                            buttonColor: backgroundColor,
                            textColor: enableRightButton ? leftButtonTextColor : AppColors.blackLv1,
                            onTap: () async {
                              if (enableLeftButton) {
                                if (onTapLeftButton != null) {
                                  onTapLeftButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink(),
                  leftButtonText != null && rightButtonText != null
                      ? Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          height: 18,
                          width: 1,
                          color: AppColors.blackLv4,
                        )
                      : const SizedBox.shrink(),
                  rightButtonText != null
                      ? Expanded(
                          child: AppButton(
                            text: rightButtonText!,
                            buttonColor: backgroundColor,
                            textColor: enableRightButton ? rightButtonTextColor : AppColors.blackLv1,
                            onTap: () async {
                              if (enableRightButton) {
                                if (onTapRightButton != null) {
                                  onTapRightButton!();
                                } else {
                                  Navigator.of(context).pop();
                                }
                              }
                            },
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
            ),
          );
  }
}

// Custom Dialog
class AppDialogCustomWidget extends StatelessWidget {
  final String? image;
  final String title;
  final String subtitle;
  final String? textButton;
  final String? textSecondButton;
  final ImgProvider imgProvider;
  final IconData? icon;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? titleColor;
  final Color? subtitleColor;
  final Axis? directionButton;
  final bool showItemBotom;
  final List<Widget>? itemBottom;
  final Widget? moreitem;
  final void Function()? onTapButton;
  final void Function()? onTapSecondButton;

  const AppDialogCustomWidget({
    super.key,
    required this.title,
    required this.subtitle,
    this.backgroundColor,
    this.borderRadius,
    this.directionButton,
    this.icon,
    this.image,
    this.imgProvider = ImgProvider.assetImage,
    this.margin,
    this.padding,
    this.subtitleColor,
    this.titleColor,
    this.showItemBotom = true,
    this.itemBottom,
    this.textButton,
    this.textSecondButton,
    this.onTapButton,
    this.onTapSecondButton,
    this.moreitem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.padding),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(AppSizes.padding * 1.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image != null
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.padding * 1.5),
                    child: AppImage(
                      image: image!,
                      imgProvider: imgProvider,
                      width: 150,
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.bold(size: 24, color: titleColor ?? Colors.white),
            ),
            SizedBox(height: AppSizes.padding * 1.5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular(size: 16, color: subtitleColor ?? Colors.white),
            ),
            showItemBotom
                ? Padding(
                    padding: EdgeInsets.only(top: AppSizes.padding * 1.5),
                    child: Flex(
                      direction: directionButton ?? Axis.vertical,
                      children: itemBottom ??
                          [
                            AppButton(
                              onTap: onTapButton ?? () {},
                              text: textButton ?? 'button',
                              rounded: true,
                            ),
                            SizedBox(height: AppSizes.padding / 2),
                            AppButton(
                              onTap: onTapSecondButton ?? () {},
                              text: textSecondButton ?? 'Button',
                              textColor: AppColors.primary,
                              buttonColor: AppColors.blueLv5,
                              rounded: true,
                            ),
                            moreitem ?? const SizedBox.shrink(),
                          ],
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
