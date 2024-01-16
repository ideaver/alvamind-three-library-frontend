import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/drop_down_model.dart';
import '../atom/app_tool_tip.dart';
import 'app_text_field.dart';

class AppDropDown extends StatefulWidget {
  final bool enabled;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final String? selectedItem;
  final EdgeInsets contentPadding;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  // final Widget? prefixWidget;
  // final Widget? suffixWidget;
  final double? iconsSize;
  final double borderRadius;
  final Color itemsBackgroundColor;
  final Color shadowColor;
  final Color fillColor;
  final Color disabledFillColor;
  final Color iconsColor;
  final Color iconsDisabledColor;
  final Color? borderColor;
  final TextEditingController? textController;
  final Function(String text)? onChanged;
  final Function()? onEditingComplete;
  final List<TextInputFormatter>? inputFormatters;
  final List<DropDownModel> items;
  final Widget Function(DropDownModel) itemsBuilder;
  final Function(DropDownModel) onTapItem;

  const AppDropDown({
    super.key,
    this.enabled = true,
    this.labelText,
    this.hintText,
    this.errorText,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.selectedItem,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 18,
    ),
    this.prefixIcon,
    this.suffixIcon,
    // this.prefixWidget,
    // this.suffixWidget,
    this.iconsSize = 16,
    this.borderRadius = 16,
    this.itemsBackgroundColor = AppColors.white,
    this.shadowColor = AppColors.blackLv9,
    this.fillColor = AppColors.blackLv9,
    this.disabledFillColor = AppColors.blackLv7,
    this.iconsColor = AppColors.blackLv5,
    this.iconsDisabledColor = AppColors.blackLv6,
    this.borderColor = AppColors.primary,
    this.textController,
    this.onChanged,
    this.onEditingComplete,
    this.inputFormatters,
    required this.items,
    required this.itemsBuilder,
    required this.onTapItem,
  });

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _controller = widget.textController ?? TextEditingController();
    _controller.text = widget.selectedItem ?? '';
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget(),
        dropDownWidget(context),
      ],
    );
  }

  Widget labelWidget() {
    if (widget.labelText == null || widget.labelText == '') {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        widget.labelText!,
        style: widget.labelStyle ??
            AppTextStyle.bodyMedium(
              fontWeight: AppFontWeight.bold,
            ),
      ),
    );
  }

  Widget fieldWidget() {
    return AppTextField(
      controller: _controller,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      enabled: false,
      errorText: widget.errorText,
      contentPadding: widget.contentPadding,
      disabledColor: widget.enabled ? widget.fillColor : widget.disabledFillColor,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      textStyle: widget.textStyle,
      prefixIcon: widget.prefixIcon,
      // prefixWidget: widget.prefixWidget,
      suffixIcon: widget.suffixIcon ?? Icons.arrow_drop_down_rounded,
      // suffixWidget: widget.suffixWidget,
      iconsSize: widget.suffixIcon != null || widget.prefixIcon != null ? widget.iconsSize : 32,
      iconsColor: widget.enabled ? widget.iconsColor : widget.iconsDisabledColor,
      borderRadius: widget.borderRadius,
      fillColor: widget.fillColor,
    );
  }

  Widget dropDownWidget(context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return AppToolTipMenu(
          enabled: widget.enabled,
          onTapItem: (i) {
            if (widget.enabled) {
              widget.onTapItem(widget.items[i]);
              _controller.text = widget.items[i].text;
            }
          },
          padding: EdgeInsets.zero,
          child: fieldWidget(),
          elevation: 12,
          itemsBackgroundColor: widget.itemsBackgroundColor,
          shadowColor: widget.shadowColor,
          itemsBorderRadius: widget.borderRadius,
          offset: Offset(0, (widget.contentPadding.top - 8)),
          itemsConstraint: BoxConstraints(minWidth: constraints.maxWidth),
          children: List.generate(widget.items.length, (i) {
            return widget.itemsBuilder(widget.items[i]);
          }),
        );
      },
    );

    // return Container(
    //   padding: padding,
    //   decoration: BoxDecoration(
    //     color: backgroundColor,
    //     border: borderWidth != null
    //         ? Border.all(
    //             width: borderWidth!,
    //             color: borderColor,
    //           )
    //         : null,
    //     borderRadius: BorderRadius.circular(borderRadius),
    //   ),
    //   child: Theme(
    //     data: Theme.of(context).copyWith(
    //       highlightColor: Colors.transparent,
    //       splashColor: Colors.transparent,
    //     ),
    //     child: PopupMenuButton(
    //       elevation: elevation,
    //       shadowColor: Colors.black54,
    //       offset: Offset(
    //         0 - padding.left,
    //         (padding.top * 2) + (borderWidth ?? 1) + 2,
    //       ),
    //       position: PopupMenuPosition.under,
    //       shape: RoundedRectangleBorder(
    //         side: borderWidth != null
    //             ? BorderSide(
    //                 width: borderWidth!,
    //                 color: borderColor,
    //               )
    //             : BorderSide.none,
    //         borderRadius: const BorderRadius.all(
    //           Radius.circular(6),
    //         ),
    //       ),
    //       child: fieldWidget(),
    //       itemBuilder: (context) {
    //         return List.generate(
    //           children.length,
    //           (i) {
    //             return PopupMenuItem(
    //               padding: itemPadding,
    //               height: 0,
    //               onTap: () {
    //                 onTapItem(i);
    //               },
    //               child: children[i],
    //             );
    //           },
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
