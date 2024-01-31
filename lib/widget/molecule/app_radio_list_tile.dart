import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

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
  final Color activeColor;
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
  final Widget? leadingWidget;
  final RadioPosition radioPosition;
  final Function(Object?) onChanged;

  const AppRadioListTile({
    super.key,
    this.enable = true,
    required this.value,
    required this.groupValue,
    this.title,
    this.subtitle,
    this.activeColor = AppColors.primary,
    this.radioFillColor = AppColors.primary,
    this.activeTileColor = AppColors.white,
    this.inactiveTileColor = AppColors.white,
    this.activeBorderColor = AppColors.primary,
    this.inactiveBorderColor = AppColors.blackLv7,
    this.titleStyle,
    this.subtitleStyle,
    this.borderWidth = 1,
    this.borderRadius = AppSizes.radius * 2,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.leadingWidget,
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
      activeColor: widget.activeColor,
      fillColor: MaterialStateColor.resolveWith((states) => widget.radioFillColor),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }

  Widget textWidget() {
    return Expanded(
      child: Row(
        children: [
          widget.leadingWidget != null
              ? Padding(
                  padding: const EdgeInsets.only(left: AppSizes.padding / 2),
                  child: widget.leadingWidget!,
                )
              : const SizedBox.shrink(),
          widget.title != null
              ? Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding - 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: widget.titleStyle ?? AppTextStyle.bodyMedium(fontWeight: AppFontWeight.medium),
                        ),
                        widget.subtitle != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  
                                  widget.subtitle!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      widget.subtitleStyle ?? AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
