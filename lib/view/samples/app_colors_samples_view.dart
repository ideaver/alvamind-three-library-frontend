import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '___sample_wrapper.dart';

class AppColorsSamplesView extends StatefulWidget {
  const AppColorsSamplesView({super.key});

  static const routeName = '/atom-app-colors';

  @override
  State<AppColorsSamplesView> createState() => _AppColorsSamplesViewState();
}

class _AppColorsSamplesViewState extends State<AppColorsSamplesView> {
  List primary = [
    AppColors.blueLv1,
    AppColors.blueLv2,
    AppColors.blueLv3,
    AppColors.blueLv4,
    AppColors.blueLv5,
    AppColors.blueLv6,
  ];

  List secondary = [
    AppColors.darkBlueLv1,
    AppColors.darkBlueLv2,
    AppColors.darkBlueLv3,
    AppColors.darkBlueLv4,
    AppColors.darkBlueLv5,
    AppColors.darkBlueLv6,
  ];

  List greyscale = [
    AppColors.blackLv1,
    AppColors.blackLv2,
    AppColors.blackLv3,
    AppColors.blackLv4,
    AppColors.blackLv5,
    AppColors.blackLv6,
    AppColors.blackLv7,
    AppColors.blackLv8,
    AppColors.blackLv9,
    AppColors.blackLv10,
  ];

  List red = [
    AppColors.redLv1,
    AppColors.redLv2,
    AppColors.redLv3,
    AppColors.redLv4,
    AppColors.redLv5,
    AppColors.redLv6,
  ];

  List green = [
    AppColors.greenLv1,
    AppColors.greenLv2,
    AppColors.greenLv3,
    AppColors.greenLv4,
    AppColors.greenLv5,
    AppColors.greenLv6,
  ];

  List yellow = [
    AppColors.yellowLv1,
    AppColors.yellowLv2,
    AppColors.yellowLv3,
    AppColors.yellowLv4,
    AppColors.yellowLv5,
    AppColors.yellowLv6,
  ];
  List orange = [
    AppColors.orangeLv1,
    AppColors.orangeLv2,
    AppColors.orangeLv3,
    AppColors.orangeLv4,
    AppColors.orangeLv5,
    AppColors.orangeLv6,
  ];
  List purple = [
    AppColors.purpleLv1,
    AppColors.purpleLv2,
    AppColors.purpleLv3,
    AppColors.purpleLv4,
    AppColors.purpleLv5,
    AppColors.purpleLv6,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Colors Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            primaryColors(),
            secondaryColors(),
            greyscaleColors(),
            redColors(),
            greenColors(),
            yellowColors(),
            orangeColors(),
            purpleColors(),
          ],
        ),
      ),
    );
  }

  Widget primaryColors() {
    return SampleWrapper(
      title: 'primary Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            primary.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: primary[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget secondaryColors() {
    return SampleWrapper(
      title: 'Secondary Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            secondary.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: secondary[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget greyscaleColors() {
    return SampleWrapper(
      title: 'Greyscale Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            greyscale.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: greyscale[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget redColors() {
    return SampleWrapper(
      title: 'Red Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            red.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: red[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget greenColors() {
    return SampleWrapper(
      title: 'Green Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            green.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: green[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget yellowColors() {
    return SampleWrapper(
      title: 'Yellow Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            yellow.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: yellow[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget orangeColors() {
    return SampleWrapper(
      title: 'Orange Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            orange.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: orange[i],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget purpleColors() {
    return SampleWrapper(
      title: 'Purple Colors',
      widget: Wrap(
        children: [
          ...List.generate(
            purple.length,
            (i) => Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: purple[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
