import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';
import '../atom/app_image.dart';

class AppLogo extends StatelessWidget {
  final String title;
  final String image;
  final TextStyle? titleStyle;
  final ImgProvider imgProvider;
  final double width;
  final double height;
  final bool withText;
  final bool isFromAppAssets;
  final String appAssetsPackageName;
  final Function()? onTap;

  const AppLogo({
    super.key,
    this.width = 52,
    this.height = 52,
    this.titleStyle,
    this.imgProvider = ImgProvider.assetImage,
    this.withText = false,
    this.onTap,
    required this.title,
    required this.image,
    // If want to load asset from origin app or other
    // set [isFromAppAssets] to false or set [appAssetsPackageName] to destination package name
    this.isFromAppAssets = true,
    this.appAssetsPackageName = 'alvamind_three_library_frontend',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          image: image,
          imgProvider: imgProvider,
          width: width,
          height: height,
          isFromAppAssets: isFromAppAssets,
          appAssetsPackageName: appAssetsPackageName,
        ),
        withText
            ? Padding(
                padding: EdgeInsets.only(left: width / 4),
                child: Text(
                  title,
                  style: titleStyle ?? AppTextStyle.bold(size: height / 1.2),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
