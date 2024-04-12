import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../atom/app_progress_indicator.dart';
import 'app_button.dart';

class AppDialog {
  static Future<dynamic> show(
    NavigatorState navigator, {
    String? title,
    Widget? child,
    String? text,
    EdgeInsets? padding,
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
    return showDialog(
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
          leftButtonText: 'Close',
          child: Column(
            children: [
              Text(
                message ?? 'Something went wrong, please contact your system administrator or try restart the app',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMedium(
                  fontWeight: AppFontWeight.medium,
                ),
              ),
              if (error != null)
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.padding),
                  child: Text(
                    error.toString().length > 35 ? error.toString().substring(0, 35) : error.toString(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodySmall(
                      fontWeight: AppFontWeight.bold,
                      color: AppColors.blackLv6,
                    ),
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
  final EdgeInsets? padding;
  final String? leftButtonText;
  final String? rightButtonText;
  final Color backgroundColor;
  final bool dismissible;
  final bool enableRightButton;
  final bool enableLeftButton;
  final Color leftButtonTextColor;
  final Color rightButtonTextColor;
  final double? elevation;
  final Function()? onTapLeftButton;
  final Function()? onTapRightButton;

  const AppDialogWidget({
    super.key,
    this.title,
    this.child,
    this.text,
    this.padding,
    this.rightButtonText,
    this.leftButtonText,
    this.backgroundColor = AppColors.white,
    this.onTapLeftButton,
    this.onTapRightButton,
    this.dismissible = true,
    this.enableRightButton = true,
    this.enableLeftButton = true,
    this.leftButtonTextColor = AppColors.blackLv1,
    this.rightButtonTextColor = AppColors.primary,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: dismissible,
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
      padding: padding ?? const EdgeInsets.all(AppSizes.padding),
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
    return leftButtonText == null && rightButtonText == null
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: <Widget>[
                leftButtonText != null
                    ? Expanded(
                        child: AppButton(
                          text: leftButtonText!,
                          buttonColor: backgroundColor,
                          textColor: enableRightButton ? leftButtonTextColor : AppColors.blackLv1,
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.padding,
                            horizontal: AppSizes.padding / 2,
                          ),
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
                          padding: const EdgeInsets.symmetric(
                            vertical: AppSizes.padding,
                            horizontal: AppSizes.padding / 2,
                          ),
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
          );
  }
}
