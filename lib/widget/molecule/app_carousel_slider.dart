import 'package:alvamind_three_library_frontend/widget/molecule/app_swipe_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';

enum SwipeIndicatorPosition { inside, outside }

class AppCarouselSlider extends StatefulWidget {
  final List<Widget> contentList;
  final CarouselController? carouselController;
  final bool autoPlay;
  final bool enableInfiniteScroll;
  final bool enlargeCenterPage;
  final bool showSwipeIndicator;
  final double viewportFraction;
  final double enlargeFactor;
  final double? height;
  final double indicatorDistance;
  final Curve autoPlayCurve;
  final Duration autoPlayAnimationDuration;
  final double indicatorWidth;
  final double indicatorHeight;
  final double indicatorBorderRadius;
  final double indicatorSpacing;
  final EdgeInsets indicatorPadding;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final SwipeIndicatorPosition swipeIndicatorPosition;

  const AppCarouselSlider({
    super.key,
    required this.contentList,
    this.carouselController,
    this.autoPlay = true,
    this.enableInfiniteScroll = true,
    this.enlargeCenterPage = false,
    this.showSwipeIndicator = true,
    this.autoPlayAnimationDuration = const Duration(milliseconds: 500),
    this.autoPlayCurve = Curves.decelerate,
    this.viewportFraction = 1.0,
    this.enlargeFactor = 0.3,
    this.height,
    this.indicatorDistance = 14,
    this.indicatorWidth = 10,
    this.indicatorHeight = 10,
    this.indicatorBorderRadius = 100,
    this.indicatorSpacing = AppSizes.padding / 2,
    this.indicatorPadding = const EdgeInsets.all(AppSizes.padding),
    this.activeIndicatorColor = AppColors.secondary,
    this.inactiveIndicatorColor = AppColors.darkBlueLv6,
    this.swipeIndicatorPosition = SwipeIndicatorPosition.inside,
  });

  @override
  State<AppCarouselSlider> createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.swipeIndicatorPosition == SwipeIndicatorPosition.inside
        ? Stack(
            children: [
              carousel(),
              indicator(),
            ],
          )
        : Column(
            children: [
              carousel(),
              SizedBox(height: widget.indicatorDistance),
              indicator(),
            ],
          );
  }

  Widget carousel() {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        autoPlay: widget.autoPlay,
        initialPage: 0,
        enlargeCenterPage: widget.enlargeCenterPage,
        enlargeFactor: widget.enlargeFactor,
        viewportFraction: widget.viewportFraction,
        autoPlayCurve: widget.autoPlayCurve,
        autoPlayAnimationDuration: widget.autoPlayAnimationDuration,
        enableInfiniteScroll: widget.enableInfiniteScroll,
        onPageChanged: (index, reason) {
          _current = index;
          setState(() {});
        },
      ),
      carouselController: widget.carouselController,
      items: widget.contentList,
    );
  }

  Widget indicator() {
    return widget.showSwipeIndicator
        ? Positioned(
            right: 0,
            left: 0,
            bottom: widget.indicatorDistance,
            child: AppSwipeIndicator(
              currentIndex: _current,
              length: widget.contentList.length,
              indicatorWidth: widget.indicatorWidth,
              indicatorHeight: widget.indicatorHeight,
              borderRadius: widget.indicatorBorderRadius,
              indicatorSpacing: widget.indicatorSpacing,
              padding: widget.indicatorPadding,
              activeIndicatorColor: widget.activeIndicatorColor,
              inactiveIndicatorColor: widget.inactiveIndicatorColor,
            ),
          )
        : const SizedBox.shrink();
  }
}
































