import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_tags.dart';
import '___sample_wrapper.dart';

class AppTagsSamplesView extends StatefulWidget {
  const AppTagsSamplesView({super.key});

  static const routeName = '/molecule-app-tag-marker';

  @override
  State<AppTagsSamplesView> createState() => _AppTagsSamplesViewState();
}

class _AppTagsSamplesViewState extends State<AppTagsSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tag Marker Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTagMarker(),
            defaultOutlinedTagMarker(),
            tagMarkerWithCustomStyle(),
            tagsWithWrapper(),
          ],
        ),
      ),
    );
  }

  Widget defaultTagMarker() {
    return const SampleWrapper(
      title: 'Default Tag Marker',
      widget: AppTags(
        text: 'Tag Marker',
      ),
    );
  }

  Widget defaultOutlinedTagMarker() {
    return const SampleWrapper(
      title: 'Default Tag Marker Outlined',
      widget: AppTags(
        text: 'Tag Marker',
        color: AppColors.white,
        textColor: AppColors.primary,
        borderWidth: 1,
        borderColor: AppColors.primary,
      ),
    );
  }

  Widget tagMarkerWithCustomStyle() {
    return const SampleWrapper(
      title: 'Tag Marker With Custom Style',
      widget: AppTags(
        text: 'Tag Marker',
        color: AppColors.redLv1,
        leftIcon: Icons.star,
        rightIcon: Icons.star,
        fontSize: 24,
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        borderRadius: 18,
      ),
    );
  }

  Widget tagsWithWrapper() {
    return SampleWrapper(
      title: 'Tag Markers With Wrapper',
      widget: Wrap(
        runSpacing: 6,
        spacing: 6,
        children: [
          ...List.generate(
            20,
            (i) => AppTags(
              text: 'Tag Marker $i',
            ),
          ),
        ],
      ),
    );
  }
}
