import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/atom/app_image.dart';
import 'sample_wrapper.dart';

class ImageSamplesView extends StatefulWidget {
  const ImageSamplesView({Key? key}) : super(key: key);

  static const routeName = '/atom-image-samples';

  @override
  State<ImageSamplesView> createState() => _ImageSamplesViewState();
}

class _ImageSamplesViewState extends State<ImageSamplesView> {
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
      ),
    );
  }
}
