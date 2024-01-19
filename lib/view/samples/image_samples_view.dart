import 'package:alvamind_three_library_frontend/app/asset/app_assets.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/atom/app_image.dart';
import 'sample_wrapper.dart';

class ImageSamplesView extends StatefulWidget {
  const ImageSamplesView({super.key});

  static const routeName = '/atom-app-image';

  @override
  State<ImageSamplesView> createState() => _ImageSamplesViewState();
}

class _ImageSamplesViewState extends State<ImageSamplesView> {
  List imageIconsList = [
    AppAssets.flagID,
    AppAssets.flagUS,
    AppAssets.mastercard,
    AppAssets.visa,
    AppAssets.paypal,
    AppAssets.gpay,
    AppAssets.applepay,
    AppAssets.bankBNI,
    AppAssets.bankBCA,
    AppAssets.bankMandiri,
    AppAssets.bankBRI,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultImage(),
            imageIcons(),
            imageWithCustomStyle(),
          ],
        ),
      ),
    );
  }

  Widget defaultImage() {
    return const SampleWrapper(
      title: 'Default Image',
      widget: AppImage(
        image: randomImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget imageIcons() {
    return SampleWrapper(
      title: 'Image Icons',
      widget: Wrap(
        children: [
          ...List.generate(
            imageIconsList.length,
            (index) => AppImage(
              image: imageIconsList[index],
              imgProvider: ImgProvider.assetImage,
              // Remove this if the widget called from another project
              isFromAppAssets: false,
            ),
          )
        ],
      ),
    );
  }

  Widget imageWithCustomStyle() {
    return const SampleWrapper(
      title: 'Image With Custom Style',
      widget: AppImage(
        image: randomImage,
        width: 100,
        height: 100,
        borderWidth: 4,
        borderRadius: 18,
        borderColor: AppColors.redLv1,
        backgroundColor: AppColors.redLv5,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }
}
