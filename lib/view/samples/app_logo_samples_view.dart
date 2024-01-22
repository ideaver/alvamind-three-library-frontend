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
            defaultLogoWithText(),
            circleLogo(),
            circleLogoWithText(),
            circleLogoWithTextCustomSize(),
            circleLogoWithTextCustomStyle(),
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

  Widget defaultLogoWithText() {
    return const SampleWrapper(
      title: 'Default Logo With Text',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget circleLogo() {
    return const SampleWrapper(
      title: 'Circle Logo',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget circleLogoWithText() {
    return const SampleWrapper(
      title: 'Circle Logo With Text',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget circleLogoWithTextCustomSize() {
    return const SampleWrapper(
      title: 'Circle Logo With Text Custom Size',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        width: 30,
        height: 30,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget circleLogoWithTextCustomStyle() {
    return SampleWrapper(
      title: 'Circle Logo With Text Custom Style',
      widget: AppLogo(
        title: 'EksporYuk',
        image: AppAssets.logo,
        withText: true,
        width: 30,
        height: 30,
        titleStyle: AppTextStyle.bold(
          size: 16,
          color: AppColors.primary,
        ),
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }
}
