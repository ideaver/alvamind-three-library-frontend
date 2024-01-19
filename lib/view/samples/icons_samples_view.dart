import 'package:alvamind_three_library_frontend/app/asset/app_icons.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import 'sample_wrapper.dart';

class IconsSamplesView extends StatefulWidget {
  const IconsSamplesView({super.key});

  static const routeName = '/atom-app-icons';

  @override
  State<IconsSamplesView> createState() => IconsSamplesViewState();
}

class IconsSamplesViewState extends State<IconsSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Icons Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultIcons(),
            customIcons(),
          ],
        ),
      ),
    );
  }

  Widget defaultIcons() {
    return const SampleWrapper(
      title: 'Default Icons',
      widget: Wrap(
        spacing: AppSizes.padding / 2,
        children: [
          Icon(Icons.edit_document),
          Icon(Icons.person),
          Icon(Icons.wallet),
          Icon(Icons.book),
          Icon(Icons.menu),
          Icon(Icons.camera),
        ],
      ),
    );
  }

  Widget customIcons() {
    return const SampleWrapper(
      title: 'Custom Icons (From AppIcons)',
      widget: Wrap(
        spacing: AppSizes.padding / 2,
        children: [
          Icon(AppIcons.Document),
          Icon(AppIcons.User),
          Icon(AppIcons.Wallet),
          Icon(AppIcons.Bookmark),
          Icon(AppIcons.Menu),
          Icon(AppIcons.mdi_photography),
        ],
      ),
    );
  }
}
