import 'package:alvamind_three_library_frontend/widget/atom/app_avatar.dart';
import 'package:flutter/material.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';

class AppLeaderboardList extends StatelessWidget {
  final Widget? leading;
  final double? width;
  final double? height;
  final double? borderRadius;
  final String? image;
  final bool? radius;
  final EdgeInsets padding;
  final Color color;
  final String titleText;
  final String subtitleText;
  final String typeText;

  const AppLeaderboardList({
    super.key,
    this.leading,
    this.width,
    this.height,
    this.borderRadius,
    this.radius = true,
    this.padding = const EdgeInsets.all(5),
    this.image,
    required this.color,
    required this.titleText,
    required this.subtitleText,
    required this.typeText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading ??
          AppAvatar(
            image: image!,
            size: 40,
          ),
      title: Text(
        titleText,
        style: AppTextStyle.bodyMedium(fontWeight: AppFontWeight.bold),
      ),
      subtitle: Text(
        subtitleText,
        style: AppTextStyle.bodyMedium(
            fontWeight: AppFontWeight.regular, color: AppColors.blackLv5),
      ),
      trailing: Container(
        width: width ?? 52,
        height: height ?? 24,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius! ? 100 : borderRadius!),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            textAlign: TextAlign.center,
            typeText,
            style: AppTextStyle.bodyXSmall(
                fontWeight: AppFontWeight.medium, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
