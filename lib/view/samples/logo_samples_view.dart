import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../widget/atom/app_logo.dart';
import 'sample_wrapper.dart';

class LogoSamplesView extends StatefulWidget {
  const LogoSamplesView({Key? key}) : super(key: key);

  static const routeName = '/atom-logo-samples';

  @override
  State<LogoSamplesView> createState() => _LogoSamplesViewState();
}

class _LogoSamplesViewState extends State<LogoSamplesView> {
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
        title: 'Reasa',
        image: AppAssets.logo,
      ),
    );
  }

  Widget defaultLogoWithText() {
    return const SampleWrapper(
      title: 'Default Logo With Text',
      widget: AppLogo(
        title: 'Reasa',
        image: AppAssets.logo,
        withText: true,
      ),
    );
  }

  Widget circleLogo() {
    return const SampleWrapper(
      title: 'Circle Logo',
      widget: AppLogo(
        title: 'Reasa',
        image: AppAssets.logoCircle,
      ),
    );
  }

  Widget circleLogoWithText() {
    return const SampleWrapper(
      title: 'Circle Logo With Text',
      widget: AppLogo(
        title: 'Reasa',
        image: AppAssets.logoCircle,
        withText: true,
      ),
    );
  }

  Widget circleLogoWithTextCustomSize() {
    return const SampleWrapper(
      title: 'Circle Logo With Text Custom Size',
      widget: AppLogo(
        title: 'Reasa',
        image: AppAssets.logoCircle,
        withText: true,
        size: 30,
      ),
    );
  }

  Widget circleLogoWithTextCustomStyle() {
    return SampleWrapper(
      title: 'Circle Logo With Text Custom Style',
      widget: AppLogo(
        title: 'Reasa',
        image: AppAssets.logoCircle,
        withText: true,
        size: 30,
        titleStyle: AppTextStyle.bold(
          size: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
