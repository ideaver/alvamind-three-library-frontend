import '../../../app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../molecule/app_chips.dart';

// ignore: must_be_immutable
class TagsOrganism extends StatefulWidget {
  final List<String> listChips;
  final EdgeInsets? padding;
  final EdgeInsets? paddingTagsBody;
  final double? fontSize;
  final double? runSpacing;
  final bool? isSelected;
  final IconData? leftIcon;
  final List<Color>? selectedColor;
  final void Function(int)? onTap;
  int? selected;

  TagsOrganism({
    super.key,
    required this.listChips,
    required this.onTap,
    this.padding,
    this.fontSize,
    this.runSpacing,
    this.leftIcon,
    this.isSelected,
    this.selected,
    this.selectedColor,
    this.paddingTagsBody,
  });

  @override
  State<TagsOrganism> createState() => _TagsOrganismState();
}

class _TagsOrganismState extends State<TagsOrganism> {
  int chipSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: widget.paddingTagsBody ?? EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          ...List.generate(widget.listChips.length, (index) {
            return Padding(
              padding: index == widget.listChips.length - 1
                  ? EdgeInsets.zero
                  : EdgeInsets.only(
                      right: widget.runSpacing ?? AppSizes.padding / 2),
              child: AppChips(
                leftIcon: widget.leftIcon,
                selectedColor:
                    widget.selectedColor?[index] ?? AppColors.primary,
                fontSize: widget.fontSize ?? 16,
                padding: widget.padding ??
                    const EdgeInsets.symmetric(
                      horizontal: AppSizes.padding,
                      vertical: AppSizes.padding / 2,
                    ),
                text: widget.listChips[index],
                onTap: () {
                  setState(() {
                    chipSelected = index;
                    widget.selected = index;
                    widget.onTap!(widget.selected!);
                  });
                },
                isSelected: chipSelected == index ? true : false,
              ),
            );
          }),
        ],
      ),
    );
  }
}
