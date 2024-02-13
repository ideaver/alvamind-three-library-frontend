import 'package:flutter/material.dart';

import '../../../app/theme/app_text_style.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../model/table_model.dart';

class AppTable extends StatefulWidget {
  final List<TableModel>? headerData;
  final List<List<TableModel>> data;
  final String? title;
  final TextStyle? titleStyle;
  final TextStyle? textStyle;
  final Alignment alignment;
  final TextAlign textAlign;
  final double? width;
  final double? height;
  final double borderRadius;
  final double? headerBottomBorderWidth;
  final double? bottomBorderWidth;
  final double? tableBorderWidth;
  final Color headerBackgroundColor;
  final Color headerBottomBorderColor;
  final Color backgroundColor;
  final Color bottomBorderColor;
  final Color tableBorderColor;
  final EdgeInsets? headerPadding;
  final EdgeInsets? padding;

  const AppTable({
    super.key,
    this.headerData,
    required this.data,
    this.title,
    this.titleStyle,
    this.textStyle,
    this.alignment = Alignment.centerLeft,
    this.textAlign = TextAlign.left,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.headerBottomBorderWidth,
    this.bottomBorderWidth = 1,
    this.tableBorderWidth,
    this.headerBackgroundColor = AppColors.blackLv8,
    this.headerBottomBorderColor = AppColors.blackLv6,
    this.backgroundColor = AppColors.white,
    this.bottomBorderColor = AppColors.blackLv7,
    this.tableBorderColor = AppColors.blackLv7,
    this.headerPadding,
    this.padding,
  });

  @override
  State<AppTable> createState() => _AppTableState();
}

class _AppTableState extends State<AppTable> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null
            ? Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  widget.title ?? '',
                  style: widget.titleStyle ?? AppTextStyle.bold(size: 18),
                ),
              )
            : const SizedBox.shrink(),
        Container(
          decoration: BoxDecoration(
            border: widget.tableBorderWidth != null
                ? Border.all(
                    width: widget.tableBorderWidth!,
                    color: widget.tableBorderColor,
                  )
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: widget.width ?? AppSizes.screenSize.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.headerData != null ? header(widget.headerData!) : const SizedBox.shrink(),
                    SizedBox(
                      height: widget.height,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...List.generate(widget.data.length, (i) {
                              return row(widget.data[i]);
                            })
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget header(List<TableModel> rowData) {
    return Container(
      decoration: BoxDecoration(
        color: widget.headerBackgroundColor,
        border: widget.headerBottomBorderWidth != null
            ? Border(
                bottom: BorderSide(
                  width: widget.headerBottomBorderWidth!,
                  color: widget.headerBottomBorderColor,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          ...List.generate(rowData.length, (i) {
            return rowData[i].expanded
                ? Expanded(
                    flex: rowData[i].flex,
                    child: rowData[i].child != null ? rowData[i].child! : child(rowData[i]),
                  )
                : rowData[i].child != null
                    ? rowData[i].child!
                    : child(rowData[i]);
          })
        ],
      ),
    );
  }

  Widget row(List<TableModel> rowData) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: widget.bottomBorderWidth != null
            ? Border(
                bottom: BorderSide(
                  width: widget.bottomBorderWidth!,
                  color: widget.bottomBorderColor,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          ...List.generate(rowData.length, (i) {
            return rowData[i].expanded
                ? Expanded(
                    flex: rowData[i].flex,
                    child: rowData[i].child != null ? rowData[i].child! : child(rowData[i]),
                  )
                : rowData[i].child != null
                    ? rowData[i].child!
                    : child(rowData[i]);
          })
        ],
      ),
    );
  }

  Widget child(TableModel data) {
    return Container(
      padding: widget.padding ?? const EdgeInsets.all(12),
      alignment: widget.alignment,
      color: data.color,
      child: Text(
        data.data ?? '',
        textAlign: widget.textAlign,
        overflow: TextOverflow.ellipsis,
        style: data.textStyle ?? widget.textStyle ?? AppTextStyle.bodyMedium(fontWeight: AppFontWeight.semibold),
      ),
    );
  }
}
