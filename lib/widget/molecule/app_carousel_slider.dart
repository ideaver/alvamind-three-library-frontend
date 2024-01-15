import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AppCarouselSlider extends StatefulWidget {
  final List<Widget> contentList;
  final CarouselController? carouselController;
  final bool? autoPlay;
  final double? viewportFraction;
  final double? height;
  final Curve? autoPlayCurve;
  final Duration? autoPlayAnimationDuration;
  final bool? enableInfiniteScroll;
  final Color? indicatorActiveColor;
  final Color? indicatorColor;

  const AppCarouselSlider({
    super.key,
    required this.contentList,
    this.carouselController,
    this.autoPlay,
    this.autoPlayAnimationDuration,
    this.autoPlayCurve,
    this.enableInfiniteScroll,
    this.viewportFraction,
    this.height,
    this.indicatorActiveColor,
    this.indicatorColor,
  });

  @override
  State<AppCarouselSlider> createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: widget.height,
          autoPlay: widget.autoPlay ?? true,
          initialPage: 0,
          enlargeCenterPage: false,
          viewportFraction: widget.viewportFraction ?? 1.0,
          autoPlayCurve: widget.autoPlayCurve ?? Curves.fastOutSlowIn,
          autoPlayAnimationDuration: widget.autoPlayAnimationDuration ?? const Duration(milliseconds: 500),
          enableInfiniteScroll: widget.enableInfiniteScroll ?? true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        carouselController: widget.carouselController,
        items: widget.contentList,
      ),
      Positioned(
        right: 0,
        left: 0,
        bottom: 15,
        child: DotsIndicator(
          dotsCount: widget.contentList.length,
          position: _current,
          decorator: DotsDecorator(
            size: const Size.square(7.0),
            activeSize: const Size(30.0, 7.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            color: widget.indicatorColor ?? AppColors.white.withOpacity(0.50),
            activeColor: widget.indicatorActiveColor ?? AppColors.white,
            spacing: const EdgeInsets.all(4),
          ),
        ),
      ),
    ]);
  }
}
