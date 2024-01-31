import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/molecule/app_tag_marker.dart';
import '___sample_wrapper.dart';

class AppTagMarkerSamplesView extends StatefulWidget {
  const AppTagMarkerSamplesView({super.key});

  static const routeName = '/molecule-app-tag-marker';

  @override
  State<AppTagMarkerSamplesView> createState() => _AppTagMarkerSamplesViewState();
}

class _AppTagMarkerSamplesViewState extends State<AppTagMarkerSamplesView> {
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
            customTagMarker(),
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

  Widget customTagMarker() {
    return const SampleWrapper(
      title: 'Tag Marker With Custom Style',
      widget: Wrap(
        runSpacing: AppSizes.padding / 2,
        spacing: AppSizes.padding / 2,
        children: [
          AppTags(
            text: 'Waiting',
            color: AppColors.blackLv7,
            textColor: AppColors.black,
          ),
          AppTags(
            text: 'Accepted',
            color: AppColors.greenLv3,
            textColor: AppColors.white,
          ),
          AppTags(
            text: 'Tag Marker',
            color: AppColors.redLv1,
            prefixIcon: Icons.star,
            suffixIcon: Icons.star,
            fontSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            borderRadius: 18,
          ),
        ],
      ),
    );
  }

  Widget tagsWithWrapper() {
    return SampleWrapper(
      title: 'Tag Markers With Wrapper',
      widget: Wrap(
        runSpacing: AppSizes.padding / 2,
        spacing: AppSizes.padding / 2,
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
