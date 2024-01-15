import 'package:flutter/material.dart';

import '../../widget/atom/app_avatar.dart';
import '../../widget/atom/app_image.dart';
import 'sample_wrapper.dart';

class AvatarSamplesView extends StatefulWidget {
  const AvatarSamplesView({Key? key}) : super(key: key);

  static const routeName = '/atom-avatar-samples';

  @override
  State<AvatarSamplesView> createState() => _AvatarSamplesViewState();
}

class _AvatarSamplesViewState extends State<AvatarSamplesView> {
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
      widget: AppAvatar(image: randomImage),
    );
  }

  Widget avatarWithIndicator() {
    return const SampleWrapper(
      title: 'Avatar With Indicator',
      widget: AppAvatar(
        image: randomImage,
        showIconButton: true,
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
      ),
    );
  }

  Widget avatarWithBorder() {
    return const SampleWrapper(
      title: 'Avatar With Border',
      widget: AppAvatar(
        image: randomImage,
        borderWidth: 2,
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
      ),
    );
  }
}
