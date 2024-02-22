import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../atom/app_image.dart';

class AppOverlayCard extends StatelessWidget {
  final Widget child;
  final Widget? overlayChild;
  final double? width;
  final double? height;
  final double? aspectRatio;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color? shadowColor;
  final List<BoxShadow>? customBoxShadow;
  final List<Color>? overlayGradientColors;
  final Alignment overlayGradientBegin;
  final Alignment overlayGradientEnd;
  final Alignment childAlignment;
  final Alignment overlayChildAlignment;
  final String? backgroundImage;
  final ImgProvider imgProvider;
  final bool isFromAppAssets;
  final String appAssetsPackageName;
  final Function()? onTap;

  const AppOverlayCard({
    super.key,
    this.onTap,
    required this.child,
    this.overlayChild,
    this.width,
    this.height,
    this.aspectRatio,
    this.padding = const EdgeInsets.all(AppSizes.padding),
    this.borderRadius = const BorderRadius.all(Radius.circular(AppSizes.radius * 2)),
    this.backgroundColor = AppColors.white,
    this.shadowColor,
    this.customBoxShadow,
    this.overlayGradientColors = const [Colors.black12, Colors.black87],
    this.overlayGradientBegin = Alignment.topCenter,
    this.overlayGradientEnd = Alignment.bottomCenter,
    this.childAlignment = Alignment.bottomCenter,
    this.overlayChildAlignment = Alignment.center,
    this.backgroundImage,
    this.imgProvider = ImgProvider.networkImage,
    this.isFromAppAssets = true,
    this.appAssetsPackageName = AppAssets.appAssetsPackageName,
  });

  @override
  Widget build(BuildContext context) {
    return aspectRatio != null || (width == null && height == null)
        ? AspectRatio(
            aspectRatio: aspectRatio ?? 1,
            child: card(),
          )
        : card();
  }

  Widget card() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadowColor == null && overlayGradientColors == null
            ? []
            : customBoxShadow ??
                [
                  BoxShadow(
                    color: shadowColor ?? overlayGradientColors!.last.withOpacity(0.32),
                    offset: const Offset(0, 6),
                    blurRadius: 12,
                  ),
                ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          children: [
            backgroundWidget(),
            overlayWidget(),
            childWidget(),
          ],
        ),
      ),
    );
  }

  Widget backgroundWidget() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
      ),
      child: backgroundImage != null
          ? ClipRRect(
              borderRadius: borderRadius,
              child: AppImage(
                image: backgroundImage!,
                imgProvider: imgProvider,
                isFromAppAssets: isFromAppAssets,
                appAssetsPackageName: appAssetsPackageName,
                width: width,
                height: height,
              ),
            )
          : const SizedBox.shrink(),
    );
  }

  Widget overlayWidget() {
    return Material(
      borderRadius: borderRadius,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            gradient: overlayGradientColors == null
                ? null
                : LinearGradient(
                    colors: overlayGradientColors!,
                    begin: overlayGradientBegin,
                    end: overlayGradientEnd,
                  ),
          ),
          child: overlayChild != null
              ? Stack(
                  alignment: overlayChildAlignment,
                  children: [overlayChild!],
                )
              : null,
        ),
      ),
    );
  }

  Widget childWidget() {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        alignment: childAlignment,
        child: child,
      ),
    );
  }
}
