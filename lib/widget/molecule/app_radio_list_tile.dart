import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import 'app_button.dart';

enum RadioPosition {
  left,
  right,
}

class AppRadioListTile extends StatefulWidget {
  final bool enable;
  final Object value;
  final Object groupValue;
  final String? title;
  final String? subtitle;
  final Color radioActiveColor;
  final Color radioFillColor;
  final Color activeTileColor;
  final Color inactiveTileColor;
  final Color activeBorderColor;
  final Color inactiveBorderColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double borderWidth;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets leadingWidgetPadding;
  final Widget? leadingWidget;
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final RadioPosition radioPosition;
  final Function(Object?) onChanged;

  const AppRadioListTile({
    super.key,
    this.enable = true,
    required this.value,
    required this.groupValue,
    this.title,
    this.subtitle,
    this.radioActiveColor = AppColors.primary,
    this.radioFillColor = AppColors.blackLv6,
    this.activeTileColor = AppColors.white,
    this.inactiveTileColor = AppColors.white,
    this.activeBorderColor = AppColors.primary,
    this.inactiveBorderColor = AppColors.blackLv7,
    this.titleStyle,
    this.subtitleStyle,
    this.borderWidth = 1,
    this.borderRadius = AppSizes.radius * 2,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.leadingWidgetPadding = const EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
    this.leadingWidget,
    this.titleWidget,
    this.subtitleWidget,
    this.radioPosition = RadioPosition.right,
    required this.onChanged,
  });

  @override
  State<AppRadioListTile> createState() => _AppRadioListTileState();
}

class _AppRadioListTileState extends State<AppRadioListTile> {
  Object? value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.enable ? 1 : 0.5,
      child: AppButton(
        onTap: () {
          if (widget.enable) {
            widget.onChanged(value);
          }
        },
        center: false,
        rounded: false,
        padding: widget.padding,
        borderWidth: widget.borderWidth,
        borderRadius: widget.borderRadius,
        borderColor: value == widget.groupValue ? widget.activeBorderColor : widget.inactiveBorderColor,
        buttonColor: value == widget.groupValue ? widget.activeTileColor : widget.inactiveTileColor,
        suffixIconWidget: Visibility(
          visible: widget.radioPosition == RadioPosition.right,
          child: radioWidget(),
        ),
        prefixIconWidget: Visibility(
          visible: widget.radioPosition == RadioPosition.left,
          child: radioWidget(),
        ),
        textWidget: textWidget(),
      ),
    );
  }

  Widget radioWidget() {
    return Radio(
      value: value,
      groupValue: widget.groupValue,
      onChanged: (val) {
        if (widget.enable) {
          widget.onChanged(val);
          value = val;
        }
      },
      fillColor: MaterialStateColor.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return widget.radioActiveColor;
        }

        return widget.radioFillColor;
      }),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget textWidget() {
    return Expanded(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          leadingWidget(),
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleWidget(),
                subtitleWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget leadingWidget() {
    if (widget.leadingWidget == null) {
      if (widget.radioPosition == RadioPosition.right) {
        return const SizedBox.shrink();
      }

      return SizedBox(width: widget.leadingWidgetPadding.horizontal / 2);
    }

    return Padding(
      padding: widget.leadingWidgetPadding,
      child: widget.leadingWidget!,
    );
  }

  Widget titleWidget() {
    if (widget.titleWidget != null) {
      return widget.titleWidget!;
    }

    return Text(
      widget.title!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: widget.titleStyle ?? AppTextStyle.bodyMedium(fontWeight: AppFontWeight.medium),
    );
  }

  Widget subtitleWidget() {
    if (widget.subtitleWidget != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: widget.subtitleWidget!,
      );
    }

    if (widget.subtitle != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          widget.subtitle!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: widget.subtitleStyle ?? AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
