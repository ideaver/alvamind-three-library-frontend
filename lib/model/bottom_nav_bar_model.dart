import 'package:flutter/material.dart';

class BottomNavBarModel {
  final String title;
  final IconData icon;
  final bool isCenterButton;

  BottomNavBarModel({
    required this.title,
    required this.icon,
    this.isCenterButton = false,
  });
}
