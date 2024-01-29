import 'package:flutter/material.dart';

class BottomNavbarModel {
  final String? title;
  final IconData? activeIcon;
  final IconData? inactiveIcon;
  final Widget? activeIconButton;
  final Widget? inactiveIconButton;

  BottomNavbarModel({
    this.title,
    this.activeIcon,
    this.inactiveIcon,
    this.activeIconButton,
    this.inactiveIconButton,
  });
}
