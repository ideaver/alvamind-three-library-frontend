import 'package:flutter/material.dart';

class StepsModel {
  final String? title;
  final String? subtitle;

  final Widget? leading;
  final bool isActive;

  StepsModel({
    this.title,
    this.subtitle,
    this.leading,
    this.isActive = false,
  });
}
