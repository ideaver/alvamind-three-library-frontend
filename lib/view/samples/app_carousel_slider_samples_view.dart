import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_carousel_slider.dart';
import '___sample_wrapper.dart';

class AppCarouselSliderSamplesView extends StatefulWidget {
  const AppCarouselSliderSamplesView({super.key});

  static const routeName = '/molecule-app-carousel-slider';

  @override
  State<AppCarouselSliderSamplesView> createState() => _AppCarouselSliderSamplesViewState();
}

class _AppCarouselSliderSamplesViewState extends State<AppCarouselSliderSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carousel Slider Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultCarouselSlider(),
            defaultCarouselSliderWithSwipeIndicatorPositionOutside(),
            customCarouselSlider(),
          ],
        ),
      ),
    );
  }

  Widget defaultCarouselSlider() {
    return SampleWrapper(
      title: 'Default Carousel Slider',
      widget: AppCarouselSlider(
        contentList: [
          ...List.generate(5, (index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
              child: AppImage(
                image: randomImage,
                width: double.maxFinite,
                borderRadius: AppSizes.radius * 2,
              ),
            );
          })
        ],
      ),
    );
  }

  Widget defaultCarouselSliderWithSwipeIndicatorPositionOutside() {
    return SampleWrapper(
      title: 'Default Carousel Slider With Swipe Indicator Position Outside',
      widget: AppCarouselSlider(
        swipeIndicatorPosition: SwipeIndicatorPosition.outside,
        contentList: [
          ...List.generate(5, (index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.padding / 2),
              child: AppImage(
                image: randomImage,
                width: double.maxFinite,
                borderRadius: AppSizes.radius * 2,
              ),
            );
          })
        ],
      ),
    );
  }

  Widget customCarouselSlider() {
    return SampleWrapper(
      title: 'Custom Carousel Slider',
      widget: AppCarouselSlider(
        viewportFraction: 0.8,
        height: 100,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.easeInOutBack,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        indicatorDistance: 8,
        indicatorWidth: 14,
        indicatorHeight: 4,
        indicatorSpacing: 4,
        activeIndicatorColor: AppColors.primary,
        inactiveIndicatorColor: AppColors.blueLv5,
        contentList: [
          ...List.generate(5, (index) {
            return const AppImage(
              image: randomImage,
              width: double.maxFinite,
              borderRadius: AppSizes.radius * 2,
            );
          })
        ],
      ),
    );
  }
}
