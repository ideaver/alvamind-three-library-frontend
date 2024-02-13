import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/molecule/app_logo.dart';
import '___sample_wrapper.dart';

class AppLogoSamplesView extends StatefulWidget {
  const AppLogoSamplesView({super.key});

  static const routeName = '/molecule-app-logo';

  @override
  State<AppLogoSamplesView> createState() => _AppLogoSamplesViewState();
}

class _AppLogoSamplesViewState extends State<AppLogoSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Logo Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultLogo(),
            defaultLogoWithTitle(),
            defaultLogoWithTitleAndVerticalAlignment(),
            defaultLogoWithTitleSubtitleAndVerticalAlignment(),
            customLogo(),
          ],
        ),
      ),
    );
  }

  Widget defaultLogo() {
    return const SampleWrapper(
      title: 'Default Logo',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget defaultLogoWithTitle() {
    return const SampleWrapper(
      title: 'Default Logo With Title',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget defaultLogoWithTitleAndVerticalAlignment() {
    return const SampleWrapper(
      title: 'Default Logo With Title & Vertical Alignment',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        alignment: AppLogoAlignment.vertical,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget defaultLogoWithTitleSubtitleAndVerticalAlignment() {
    return const SampleWrapper(
      title: 'Default Logo With Title, Subtitle & Vertical Alignment',
      widget: AppLogo(
        title: 'EksporYuk',
        subtitle: 'Sukseskan Ekspormu!',
        image: AppAssets.logo,
        withText: true,
        alignment: AppLogoAlignment.vertical,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget customLogo() {
    return SampleWrapper(
      title: 'Custom Logo ',
      widget: AppLogo(
        title: 'EksporYuk',
        subtitle: 'Sukseskan Ekspormu!',
        image: AppAssets.logo,
        withText: true,
        width: 90,
        height: 56,
        titleStyle: AppTextStyle.bold(size: 32, color: AppColors.primary),
        subtitleStyle: AppTextStyle.regular(size: 14, color: AppColors.blackLv2),
        alignment: AppLogoAlignment.vertical,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }
}
