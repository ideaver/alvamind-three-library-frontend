import 'package:flutter/material.dart';

class TableModel {
  final String? data;
  final int flex;
  final bool expanded;
  final Widget? child;
  final TextStyle? textStyle;
  final Color? color;

  TableModel({
    this.data,
    this.flex = 1,
    this.expanded = true,
    this.child,
    this.textStyle,
    this.color,
  });
}
