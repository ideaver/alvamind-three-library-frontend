import 'package:flutter/material.dart';

import '../../app/theme/app_text_style.dart';
import 'app_image.dart';

class AppLogo extends StatelessWidget {
  final String title;
  final String image;
  final TextStyle? titleStyle;
  final ImgProvider imgProvider;
  final double size;
  final bool withText;
  final Function()? onTap;

  const AppLogo({
    super.key,
    this.size = 52,
    this.titleStyle,
    this.imgProvider = ImgProvider.assetImage,
    this.withText = false,
    this.onTap,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppImage(
          image: image,
          imgProvider: imgProvider,
          width: withText ? null : size,
          height: size,
        ),
        withText
            ? Padding(
                padding: EdgeInsets.only(left: size / 4),
                child: Text(
                  title,
                  style: titleStyle ?? AppTextStyle.bold(size: size / 1.2),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
