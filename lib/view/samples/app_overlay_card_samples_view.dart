import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_overlay_card.dart';
import 'package:flutter/material.dart';

import '___sample_wrapper.dart';

class AppOverlayCardSamplesView extends StatefulWidget {
  const AppOverlayCardSamplesView({super.key});

  static const routeName = '/molecule-app-overlay-card';

  @override
  State<AppOverlayCardSamplesView> createState() => _AppOverlayCardSamplesViewState();
}

class _AppOverlayCardSamplesViewState extends State<AppOverlayCardSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overlay Card Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultOverlayCard(),
            overlayCardWithCustomSize(),
            customOverlayCard(),
          ],
        ),
      ),
    );
  }

  Widget defaultOverlayCard() {
    return SampleWrapper(
      title: 'Default Overlay Card',
      widget: AppOverlayCard(onTap: () {}, isFromAppAssets: false, child: childSample1()),
    );
  }

  Widget overlayCardWithCustomSize() {
    return SampleWrapper(
      title: 'Overlay Card with custom size',
      widget: AppOverlayCard(
        onTap: () {},
        width: 200,
        height: 260,
        isFromAppAssets: false,
        child: childSample2(),
      ),
    );
  }

  Widget customOverlayCard() {
    return SampleWrapper(
      title: 'Custom Overlay Card',
      widget: AppOverlayCard(
        onTap: () {},
        width: 200,
        height: 260,
        borderRadius: const BorderRadius.all(Radius.circular(AppSizes.radius)),
        overlayGradientBegin: Alignment.topLeft,
        overlayGradientEnd: Alignment.bottomRight,
        overlayGradientColors: [AppColors.yellowLv1.withOpacity(0.01), AppColors.yellowLv1],
        shadowColor: AppColors.blackLv5,
        isFromAppAssets: false,
        child: childSample2(),
      ),
    );
  }

  Widget childSample1() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Child Here',
          style: AppTextStyle.heading2(
            color: AppColors.white,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet',
          style: AppTextStyle.heading6(
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(onTap: () {}, text: 'Button'),
      ],
    );
  }

  Widget childSample2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: AppIconButton(
              icon: const Icon(
                AppIcons.share,
                color: AppColors.white,
              ),
              iconButtonColor: AppColors.transparent,
              padding: EdgeInsets.zero,
              onTap: () {},
            ),
          ),
        ),
        Text(
          'Child Here',
          style: AppTextStyle.heading4(
            color: AppColors.white,
          ),
        ),
        Text(
          'Lorem ipsum dolor sit amet',
          style: AppTextStyle.regular(
            size: 12,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: AppSizes.padding),
        AppButton(
          onTap: () {},
          text: 'Button',
        ),
      ],
    );
  }
}
