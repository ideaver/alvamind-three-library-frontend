import 'package:flutter/material.dart';

import '../../widget/atom/app_avatar.dart';
import '../../widget/atom/app_image.dart';
import '___sample_wrapper.dart';

class AppAvatarSamplesView extends StatefulWidget {
  const AppAvatarSamplesView({super.key});

  static const routeName = '/atom-app-avatar';

  @override
  State<AppAvatarSamplesView> createState() => _AppAvatarSamplesViewState();
}

class _AppAvatarSamplesViewState extends State<AppAvatarSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            avatarOnly(),
            avatarWithIndicator(),
            avatarWithIndicatorDisabled(),
            avatarWithIconButton(),
            avatarWithBorder(),
            avatarWithBorderDisabled(),
            avatarWithIconButtonCustomSize(),
            avatarWithIconButtonCustomSizeAndRadius(),
          ],
        ),
      ),
    );
  }

  Widget avatarOnly() {
    return const SampleWrapper(
      title: 'Avatar Only',
      widget: AppAvatar(
        image: randomImage,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithIndicator() {
    return const SampleWrapper(
      title: 'Avatar With Indicator',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithIndicatorDisabled() {
    return const SampleWrapper(
      title: 'Avatar With Indicator Disabled',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
        enabled: false,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithIconButton() {
    return const SampleWrapper(
      title: 'Avatar With Icon Button',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
        icon: Icons.add,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithBorder() {
    return const SampleWrapper(
      title: 'Avatar With Border',
      widget: AppAvatar(
        image: randomImage,
        borderWidth: 2,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithBorderDisabled() {
    return const SampleWrapper(
      title: 'Avatar With Border Disabled',
      widget: AppAvatar(
        image: randomImage,
        borderWidth: 2,
        enabled: false,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithIconButtonCustomSize() {
    return const SampleWrapper(
      title: 'Avatar With Icon Button Custom Size',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
        icon: Icons.add,
        size: 200,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }

  Widget avatarWithIconButtonCustomSizeAndRadius() {
    return const SampleWrapper(
      title: 'Avatar With Icon Button Custom Size And Radius',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
        icon: Icons.add,
        size: 200,
        borderRadius: 32,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
      ),
    );
  }
}
