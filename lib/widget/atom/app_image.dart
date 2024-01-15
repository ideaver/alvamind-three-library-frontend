import 'dart:io';

import '../../app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../app/asset/app_assets.dart';
import '../../app/utility/console_log.dart';
import 'app_progress_indicator.dart';

// App Image Widget
// v.2.0.1
// by Elriz Wiraswara

enum ImgProvider {
  networkImage,
  assetImage,
  fileImage,
}

// For develompment purpose
const String randomImage = 'https://source.unsplash.com/512x512?food';

class AppImage extends StatefulWidget {
  final String image;
  final List<String>? allImages;
  final ImgProvider imgProvider;
  final String placeholder;
  final String noImagePlaceholder;
  final BoxFit? fit;
  final Duration? fadeInDuration;
  final Widget? errorWidget;
  final bool enableFullScreenView;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool isFromAppAssets;
  final String appAssetsPackageName;

  const AppImage({
    Key? key,
    required this.image,
    this.allImages,
    this.imgProvider = ImgProvider.networkImage,
    this.placeholder = AppAssets.loadingGif,
    this.noImagePlaceholder = AppAssets.emptyPlaceholder,
    this.fit,
    this.fadeInDuration,
    this.errorWidget,
    this.enableFullScreenView = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderColor = AppColors.primary,
    this.borderWidth,
    this.borderRadius,
    // If want to load asset from origin app or other
    // set [isFromAppAssets] to false or set [appAssetsPackageName] to destination package name
    this.isFromAppAssets = true,
    this.appAssetsPackageName = 'alvamind_library',
  }) : super(key: key);

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage> {
  static const int _maxAttempt = 5;

  int _imgErrorAttempt = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.enableFullScreenView
          ? () {
              if ((widget.allImages == null || widget.allImages!.isEmpty) && widget.image == '') {
                return;
              }

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AppImageViewer(
                    images: widget.allImages ?? [widget.image],
                    imgProvider: widget.imgProvider,
                  ),
                ),
              );
            }
          : null,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: widget.borderRadius == null ? null : BorderRadius.circular(widget.borderRadius!),
          border: widget.borderWidth == null
              ? null
              : Border.all(
                  width: widget.borderWidth!,
                  color: widget.borderColor,
                ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            (widget.borderRadius ?? 0) - (widget.borderWidth ?? 0),
          ),
          child: widget.image == ''
              ? noImage()
              : widget.imgProvider == ImgProvider.networkImage
                  ? networkImage()
                  : widget.imgProvider == ImgProvider.assetImage
                      ? assetImage()
                      : fileImage(),
        ),
      ),
    );
  }

  Widget networkImage() {
    return OptimizedCacheImage(
      imageUrl: widget.image,
      fit: widget.fit ?? BoxFit.cover,
      fadeInDuration: const Duration(milliseconds: 200),
      placeholder: (context, string) {
        return Image.asset(
          widget.placeholder,
          package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
        );
      },
      errorWidget: (context, object, stack) {
        if (_imgErrorAttempt <= _maxAttempt) {
          _imgErrorAttempt += 1;
          cl('IMAGE LOAD ERROR, ATTEMP = $_imgErrorAttempt');
          cl('IMAGE LOAD ERROR = $object');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {});
          });
          return Container();
        }
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.blackLv4,
              ),
            );
      },
    );
  }

  Widget assetImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(
        widget.placeholder,
        package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
      ),
      image: AssetImage(
        widget.image,
        package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
      ),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.blackLv4,
              ),
            );
      },
    );
  }

  Widget fileImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(
        widget.placeholder,
        package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
      ),
      image: FileImage(
        File(widget.image),
      ),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.blackLv4,
              ),
            );
      },
    );
  }

  Widget noImage() {
    return FadeInImage(
      fadeInDuration: const Duration(milliseconds: 200),
      fit: widget.fit ?? BoxFit.cover,
      placeholder: AssetImage(
        widget.placeholder,
        package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
      ),
      image: AssetImage(
        widget.noImagePlaceholder,
        package: widget.isFromAppAssets ? widget.appAssetsPackageName : null,
      ),
      imageErrorBuilder: (context, object, stack) {
        return widget.errorWidget ??
            const Center(
              child: Icon(
                Icons.broken_image_rounded,
                color: AppColors.blackLv4,
              ),
            );
      },
    );
  }
}

// Full screen images viewer
class AppImageViewer extends StatefulWidget {
  final List<String> images;
  final ImgProvider imgProvider;

  const AppImageViewer({
    super.key,
    required this.images,
    this.imgProvider = ImgProvider.networkImage,
  });

  @override
  State<AppImageViewer> createState() => _AppImageViewerState();
}

class _AppImageViewerState extends State<AppImageViewer> {
  ImageProvider imageProvider(String img) {
    if (widget.imgProvider == ImgProvider.fileImage) {
      return FileImage(File(img));
    } else if (widget.imgProvider == ImgProvider.assetImage) {
      return AssetImage(img);
    } else {
      return NetworkImage(img);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: imageProvider(widget.images[index]),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.contained,
            heroAttributes: const PhotoViewHeroAttributes(tag: 'image_viewer'),
          );
        },
        itemCount: widget.images.length,
        loadingBuilder: (context, event) {
          return const AppProgressIndicator(
            color: Colors.white,
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}
