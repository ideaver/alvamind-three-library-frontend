import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppRadio extends StatefulWidget {
  final bool enable;
  final Object value;
  final Object groupValue;
  final String? title;
  final Color activeColor;
  final Color fillColor;
  final TextStyle? titleStyle;
  final EdgeInsets padding;
  final Function(Object?) onChanged;

  const AppRadio({
    Key? key,
    this.enable = true,
    required this.value,
    required this.groupValue,
    this.title,
    this.activeColor = AppColors.primary,
    this.fillColor = AppColors.primary,
    this.titleStyle,
    this.padding = EdgeInsets.zero,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<AppRadio> createState() => _AppRadioState();
}

class _AppRadioState extends State<AppRadio> {
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
      child: GestureDetector(
        onTap: () {
          if (widget.enable) {
            widget.onChanged(value);
          }
        },
        child: Padding(
          padding: widget.padding,
          child: Row(
            children: [
              Radio(
                value: widget.value,
                groupValue: widget.groupValue,
                onChanged: (val) {
                  if (widget.enable) {
                    widget.onChanged(val);
                    value = val;
                  }
                },
                activeColor: widget.activeColor,
                fillColor: MaterialStateColor.resolveWith((states) => widget.fillColor),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
              widget.title != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Text(
                        widget.title!,
                        style: widget.titleStyle ??
                            AppTextStyle.bodyMedium(
                              fontWeight: AppFontWeight.semibold,
                            ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
