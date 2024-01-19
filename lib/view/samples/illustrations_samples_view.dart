import 'package:flutter/material.dart';

import '../../app/asset/app_assets.dart';
import '../../widget/atom/app_image.dart';
import 'sample_wrapper.dart';

class IllustrationsSamplesView extends StatefulWidget {
  const IllustrationsSamplesView({super.key});

  static const routeName = '/atom-app-illustrations';

  @override
  State<IllustrationsSamplesView> createState() => _IllustrationsSamplesViewState();
}

class _IllustrationsSamplesViewState extends State<IllustrationsSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Illustrations Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checklistLight(),
            faceIdLight(),
            fingerprintLight(),
            nodataLight(),
            referralLight(),
            successLight(),
            checklistDark(),
            faceIdDark(),
            fingerprintDark(),
            nodataDark(),
            referralDark(),
            successDark(),
            ob1Light(),
            ob2Light(),
            ob3Light(),
            ob4Light(),
            ob5Light(),
            ob6Light(),
            ob1Dark(),
            ob2Dark(),
            ob3Dark(),
            ob4Dark(),
          ],
        ),
      ),
    );
  }

  Widget checklistLight() {
    return const SampleWrapper(
      title: 'Check List Light',
      widget: AppImage(
        image: AppAssets.checklistLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget faceIdLight() {
    return const SampleWrapper(
      title: 'Face ID Light',
      widget: AppImage(
        image: AppAssets.faceIdLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget fingerprintLight() {
    return const SampleWrapper(
      title: 'Fingerprint Light',
      widget: AppImage(
        image: AppAssets.fingerprintLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget nodataLight() {
    return const SampleWrapper(
      title: 'No Data Light',
      widget: AppImage(
        image: AppAssets.nodataLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget referralLight() {
    return const SampleWrapper(
      title: 'Referral Light',
      widget: AppImage(
        image: AppAssets.referralLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget successLight() {
    return const SampleWrapper(
      title: 'Success Light',
      widget: AppImage(
        image: AppAssets.successLight,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget checklistDark() {
    return const SampleWrapper(
      title: 'Check List Dark',
      widget: AppImage(
        image: AppAssets.checklistDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget faceIdDark() {
    return const SampleWrapper(
      title: 'Face ID Dark',
      widget: AppImage(
        image: AppAssets.faceIdDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget fingerprintDark() {
    return const SampleWrapper(
      title: 'Fingerprint Dark',
      widget: AppImage(
        image: AppAssets.fingerprintDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget nodataDark() {
    return const SampleWrapper(
      title: 'No Data Dark',
      widget: AppImage(
        image: AppAssets.nodataDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget referralDark() {
    return const SampleWrapper(
      title: 'Referral Dark',
      widget: AppImage(
        image: AppAssets.referralDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget successDark() {
    return const SampleWrapper(
      title: 'Succcess Dark',
      widget: AppImage(
        image: AppAssets.successDark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob1Light() {
    return const SampleWrapper(
      title: 'Onboarding 1 Light',
      widget: AppImage(
        image: AppAssets.ob1Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob2Light() {
    return const SampleWrapper(
      title: 'Onboarding 2 Light',
      widget: AppImage(
        image: AppAssets.ob2Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob3Light() {
    return const SampleWrapper(
      title: 'Onboarding 3 Light',
      widget: AppImage(
        image: AppAssets.ob3Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob4Light() {
    return const SampleWrapper(
      title: 'Onboarding 4 Light',
      widget: AppImage(
        image: AppAssets.ob4Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob5Light() {
    return const SampleWrapper(
      title: 'Onboarding 5 Light',
      widget: AppImage(
        image: AppAssets.ob5Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob6Light() {
    return const SampleWrapper(
      title: 'Onboarding 6 Light',
      widget: AppImage(
        image: AppAssets.ob6Light,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob1Dark() {
    return const SampleWrapper(
      title: 'Onboarding 1 Dark',
      widget: AppImage(
        image: AppAssets.ob1Dark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob2Dark() {
    return const SampleWrapper(
      title: 'Onboarding 2 Dark',
      widget: AppImage(
        image: AppAssets.ob2Dark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob3Dark() {
    return const SampleWrapper(
      title: 'Onboarding 3 Dark',
      widget: AppImage(
        image: AppAssets.ob3Dark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget ob4Dark() {
    return const SampleWrapper(
      title: 'Onboarding 4 Dark',
      widget: AppImage(
        image: AppAssets.ob4Dark,
        imgProvider: ImgProvider.assetImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }
}
