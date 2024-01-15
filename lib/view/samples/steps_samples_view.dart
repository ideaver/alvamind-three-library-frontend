import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/utility/date_formatter.dart';
import '../../model/steps_model.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_steps.dart';
import 'sample_wrapper.dart';

class StepsSamplesView extends StatefulWidget {
  const StepsSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-steps-samples';

  @override
  State<StepsSamplesView> createState() => _StepsSamplesViewState();
}

class _StepsSamplesViewState extends State<StepsSamplesView> {
  List<StepsModel> basicSteps = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
        isActive: i < 2 ? true : false,
      ),
    )
  ];

  List<StepsModel> customSteps1 = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
        isActive: i < 2 ? true : false,
        leading: i == 0
            ? const Icon(
                Icons.location_on,
                color: AppColors.greenLv1,
                size: 32,
              )
            : null,
      ),
    )
  ];

  List<StepsModel> customSteps2 = [
    StepsModel(
      title: 'Title 1',
      subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
      isActive: true,
      leading: const Icon(
        Icons.location_on,
        color: AppColors.primary,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 2',
      subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
      isActive: true,
      leading: const Icon(
        Icons.person,
        color: AppColors.primary,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 3',
      subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
      isActive: false,
      leading: const Icon(
        Icons.local_shipping,
        color: AppColors.blackLv5,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 4',
      subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
      isActive: false,
      leading: const Icon(
        Icons.house,
        color: AppColors.blackLv5,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 5',
      subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
      isActive: false,
      leading: const Icon(
        Icons.card_giftcard_rounded,
        color: AppColors.blackLv5,
        size: 32,
      ),
    ),
  ];

  List<StepsModel> customSteps3 = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDateShortedYearWithClock(DateTime.now().toIso8601String()),
        isActive: i < 2 ? true : false,
        leading: AppImage(
          image: randomImage,
          borderWidth: 3,
          borderRadius: 100,
          borderColor: i < 2 ? AppColors.primary : AppColors.blackLv5,
        ),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Steps Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultVerticalSteps(),
            defaultHorizontalSteps(),
            defaultHorizontalStepsCustomWidth(),
            defaultHorizontalStepsWithCounter(),
            defaultVerticalStepsCustomFirstLeading(),
            verticalStepsCustomLeadings(),
            verticalStepsCustomLeadingsAndStyles(),
            horizontalStepsCustomLeadingsAndStyles(),
          ],
        ),
      ),
    );
  }

  Widget defaultVerticalSteps() {
    return SampleWrapper(
      title: 'Default Vertical Steps',
      widget: SizedBox(
        height: AppSizes.screenSize.width,
        child: AppSteps(
          steps: basicSteps,
          direction: Axis.vertical,
        ),
      ),
    );
  }

  Widget defaultHorizontalSteps() {
    return SampleWrapper(
      title: 'Default Horizontal Steps',
      widget: AppSteps(
        steps: basicSteps,
        direction: Axis.horizontal,
        titleFontSize: 14,
        subtitleFontSize: 10,
      ),
    );
  }

  Widget defaultHorizontalStepsCustomWidth() {
    return SampleWrapper(
      title: 'Default Horizontal Custom Size',
      widget: SizedBox(
        width: AppSizes.screenSize.width - 120,
        child: AppSteps(
          steps: basicSteps,
          direction: Axis.horizontal,
          titleFontSize: 10,
          subtitleFontSize: 6,
          leadingSize: 24,
          dashHeight: 1,
        ),
      ),
    );
  }

  Widget defaultHorizontalStepsWithCounter() {
    return SampleWrapper(
      title: 'Default Horizontal Steps With Counter',
      widget: AppSteps(
        steps: basicSteps,
        direction: Axis.horizontal,
        titleFontSize: 14,
        subtitleFontSize: 10,
        showCounter: true,
      ),
    );
  }

  Widget defaultVerticalStepsCustomFirstLeading() {
    return SampleWrapper(
      title: 'Default Vertical Steps Custom First Leading',
      widget: SizedBox(
        height: AppSizes.screenSize.width,
        child: AppSteps(
          steps: customSteps1,
          direction: Axis.vertical,
        ),
      ),
    );
  }

  Widget verticalStepsCustomLeadings() {
    return SampleWrapper(
      title: 'Default Vertical Steps Custom Leadings',
      widget: SizedBox(
        height: AppSizes.screenSize.width,
        child: AppSteps(
          steps: customSteps2,
          direction: Axis.vertical,
        ),
      ),
    );
  }

  Widget verticalStepsCustomLeadingsAndStyles() {
    return SampleWrapper(
      title: 'Vertical Steps Custom Leadings & Styles',
      widget: SizedBox(
        height: AppSizes.screenSize.width,
        child: AppSteps(
          steps: customSteps2,
          direction: Axis.vertical,
          titleActiveColor: AppColors.primary,
          activeDashColor: AppColors.primary,
          dashFillRate: 1,
          dashRadius: 0,
        ),
      ),
    );
  }

  Widget horizontalStepsCustomLeadingsAndStyles() {
    return SampleWrapper(
      title: 'Horizontal Steps Custom Leadings & Styles',
      widget: AppSteps(
        steps: customSteps3,
        direction: Axis.horizontal,
        titleActiveColor: AppColors.primary,
        subtitleActiveColor: AppColors.primary,
        activeDashColor: AppColors.primary,
        titleFontSize: 12,
        subtitleFontSize: 8,
        showSubtitle: false,
      ),
    );
  }
}
