import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import 'app_icon_button.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? bottom;
  final String? title;
  final String? subtitle;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final double elevation;
  final double appBarHeight;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final Color? backgroundColor;
  final Color shadowColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool automaticallyImplyLeading;
  final bool centerTitle;

  const AppAppbar({
    super.key,
    this.leading,
    this.titleWidget,
    this.actions,
    this.bottom,
    this.title,
    this.subtitle,
    this.padding = const EdgeInsets.all(AppSizes.padding / 2),
    this.titlePadding = const EdgeInsets.symmetric(horizontal: AppSizes.padding / 1.5),
    this.elevation = 0,
    this.appBarHeight = kToolbarHeight,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.backgroundColor,
    this.shadowColor = AppColors.blackLv7,
    this.systemOverlayStyle,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: appBar(context),
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      titleSpacing: 0,
      elevation: elevation,
      shadowColor: shadowColor,
      titleTextStyle: titleTextStyle ?? AppTextStyle.heading5(),
      systemOverlayStyle: systemOverlayStyle,
      backgroundColor: backgroundColor,
    );
  }

  Widget leadingWidget(BuildContext context) {
    if (leading != null) {
      return leading!;
    }

    if (!automaticallyImplyLeading) {
      if (centerTitle) {
        // Replacement widget for centering title widget
        return Opacity(opacity: 0.0, child: backButton(context, enabled: false));
      }

      return const SizedBox.shrink();
    }

    return backButton(context);
  }

  Widget appBar(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: padding,
            child: Row(
              children: [
                leadingWidget(context),
                Expanded(child: appBarTitleWidget()),
                actionsWidget(context),
              ],
            ),
          ),
          bottom == null ? const SizedBox.shrink() : bottom!,
        ],
      ),
    );
  }

  Widget appBarTitleWidget() {
    return Padding(
      padding: titlePadding,
      child: titleWidget != null
          ? titleWidget!
          : Column(
              crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? '',
                  style: titleTextStyle ?? AppTextStyle.heading6(),
                ),
                subtitle != null
                    ? Text(
                        subtitle!,
                        style: subtitleTextStyle ?? AppTextStyle.bodyXSmall(fontWeight: AppFontWeight.medium),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
    );
  }

  Widget actionsWidget(BuildContext context) {
    if (actions == null) {
      if (centerTitle) {
        // Replacement widget for centering title widget
        return Opacity(opacity: 0.0, child: backButton(context, enabled: false));
      }

      return const SizedBox.shrink();
    }

    return SizedBox(
      child: Row(
        children: actions!,
      ),
    );
  }

  Widget backButton(BuildContext context, {bool enabled = true}) {
    return AppIconButton(
      icon: const Icon(Icons.keyboard_arrow_left_rounded),
      iconButtonColor: AppColors.transparent,
      borderWidth: 1,
      padding: const EdgeInsets.all(AppSizes.padding / 4),
      enable: enabled,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
