import 'package:flutter/material.dart';

import '../../app/theme/app_sizes.dart';
import '../../widget/atom/app_maps.dart';
import '___sample_wrapper.dart';

class AppMapsSamplesView extends StatefulWidget {
  const AppMapsSamplesView({super.key});

  static const routeName = '/atom-app-maps';

  @override
  State<AppMapsSamplesView> createState() => _IllustrationsSamplesViewState();
}

class _IllustrationsSamplesViewState extends State<AppMapsSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maps Samples')),
      body: const AppMaps(
        lat: 30.488774662306618,
        lng: 31.032559163868427,
      ),
    );
  }

  Widget constrainedMaps() {
    return SampleWrapper(
      title: 'Default Maps',
      widget: SizedBox(
        width: AppSizes.screenSize.width,
        height: AppSizes.screenSize.width,
        child: const AppMaps(
          lat: 30.488774662306618,
          lng: 31.032559163868427,
        ),
      ),
    );
  }
}
