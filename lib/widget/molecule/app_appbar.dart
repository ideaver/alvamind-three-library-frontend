import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAppbar extends StatelessWidget {
  final Widget? leading;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? bottom;
  final String? title;
  final String? subtitle;
  final EdgeInsets padding;
  final EdgeInsets titlePadding;
  final double elevation;
  final double? toolbarHeight;
  final double bottomHeight;
  final double? appBarHeight;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
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
    this.padding = const EdgeInsets.all(AppSizes.padding / 1.5),
    this.titlePadding = const EdgeInsets.symmetric(horizontal: AppSizes.padding / 1.5),
    this.elevation = 0.2,
    this.toolbarHeight,
    this.bottomHeight = kToolbarHeight,
    this.appBarHeight,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.shadowColor = AppColors.blackLv7,
    this.systemOverlayStyle,
    this.automaticallyImplyLeading = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(appBarHeight ?? AppBar().preferredSize.height),
      child: AppBar(
        title: _appBar(context),
        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        leadingWidth: 0,
        titleSpacing: 0,
        elevation: elevation,
        toolbarHeight: appBarHeight,
        shadowColor: shadowColor,
        titleTextStyle: titleTextStyle ?? AppTextStyle.heading5(),
        systemOverlayStyle: systemOverlayStyle,
        // bottom: bottom == null
        //     ? null
        //     : PreferredSize(
        //         preferredSize: Size.fromHeight(bottomHeight),
        //         child: bottom!,
        //       ),
      ),
    );
  }

  Widget _leadingWidget(BuildContext context) {
    if (!automaticallyImplyLeading) {
      return const SizedBox.shrink();
    }

    if (leading != null) {
      return leading!;
    }

    return AppIconButton(
      icon: const Icon(Icons.keyboard_arrow_left_rounded),
      iconButtonColor: AppColors.transparent,
      borderColor: AppColors.blackLv9,
      borderWidth: 1,
      padding: const EdgeInsets.all(AppSizes.padding / 4),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  Widget _appBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Row(
            children: [
              _leadingWidget(context),
              Expanded(child: _titleWidget()),
              _actionsWidget(),
            ],
          ),
        ),
        bottom == null ? const SizedBox.shrink() : bottom!,
      ],
    );
  }

  Widget _titleWidget() {
    return Padding(
      padding: titlePadding,
      child: titleWidget != null
          ? titleWidget!
          : Column(
              crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
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

  Widget _actionsWidget() {
    if (actions == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      child: Row(
        children: actions!,
      ),
    );
  }
}
