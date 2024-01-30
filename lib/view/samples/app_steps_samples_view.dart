import '../../app/theme/app_text_style.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/utility/date_formatter.dart';
import '../../model/steps_model.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_steps.dart';
import '___sample_wrapper.dart';

class AppStepsSamplesView extends StatefulWidget {
  const AppStepsSamplesView({super.key});

  static const routeName = '/molecule-app-steps';

  @override
  State<AppStepsSamplesView> createState() => _AppStepsSamplesViewState();
}

class _AppStepsSamplesViewState extends State<AppStepsSamplesView> {
  List<StepsModel> basicSteps = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
        isActive: i < 2 ? true : false,
      ),
    )
  ];

  List<StepsModel> customSteps0 = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
        isActive: i < 2 ? true : false,
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.check,
            color: AppColors.white,
            size: 16,
          ),
        ),
      ),
    )
  ];

  List<StepsModel> customSteps1 = [
    ...List.generate(
      5,
      (i) => StepsModel(
        title: 'Title ${i + 1}',
        subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
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
      subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
      isActive: true,
      leading: const Icon(
        Icons.location_on,
        color: AppColors.primary,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 2',
      subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
      isActive: true,
      leading: const Icon(
        Icons.person,
        color: AppColors.primary,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 3',
      subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
      isActive: false,
      leading: const Icon(
        Icons.local_shipping,
        color: AppColors.blackLv5,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 4',
      subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
      isActive: false,
      leading: const Icon(
        Icons.house,
        color: AppColors.blackLv5,
        size: 32,
      ),
    ),
    StepsModel(
      title: 'Title 5',
      subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
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
        subtitle: DateFormatter.slashDate(DateTime.now().toIso8601String()),
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
            defaultHorizontalSteps(),
            defaultHorizontalStepsWithSubtitle(),
            defaultHorizontalStepsWithUncontinuousStepLine(),
            defaultHorizontalStepsWithoutStepline(),
            defaultHorizontalStepsCustomSize(),
            defaultHorizontalStepsWithDashedLine(),
            customHorizontalStepsLine(),
            customLeadingsAndStylesHorizontalStepsLineCustom(),
            defaultVerticalSteps(),
            defaultVerticalStepsCustomFirstLeading(),
            verticalStepsCustomLeadings(),
            verticalStepsCustomLeadingsAndStyles(),
          ],
        ),
      ),
    );
  }

  Widget defaultHorizontalSteps() {
    return SampleWrapper(
      title: 'Default Horizontal Steps',
      widget: AppSteps(
        steps: basicSteps,
        titleFontSize: 12,
        showSubtitle: false,
      ),
    );
  }

  Widget defaultHorizontalStepsWithSubtitle() {
    return SampleWrapper(
      title: 'Default Horizontal Steps With Subtitle',
      widget: AppSteps(
        steps: basicSteps,
        titleFontSize: 12,
        subtitleFontSize: 8,
      ),
    );
  }

  Widget defaultHorizontalStepsWithUncontinuousStepLine() {
    return SampleWrapper(
      title: 'Default Horizontal Steps With Uncontinuous Step Line',
      widget: AppSteps(
        steps: basicSteps,
        titleFontSize: 12,
        subtitleFontSize: 8,
        isStepLineContinuous: false,
      ),
    );
  }

  Widget defaultHorizontalStepsWithoutStepline() {
    return SampleWrapper(
      title: 'Default Horizontal Steps Without Step Line',
      widget: AppSteps(
        steps: basicSteps,
        titleFontSize: 12,
        subtitleFontSize: 8,
        showStepLine: false,
      ),
    );
  }

  Widget defaultHorizontalStepsCustomSize() {
    return SampleWrapper(
      title: 'Default Horizontal Steps With Custom Size',
      widget: AppSteps(
        steps: basicSteps,
        direction: Axis.horizontal,
        titleFontSize: 10,
        subtitleFontSize: 6,
        leadingSize: 24,
        stepLineHeight: 1,
      ),
    );
  }

  Widget defaultHorizontalStepsWithDashedLine() {
    return SampleWrapper(
      title: 'Default Horizontal Steps With Dashed Line',
      widget: AppSteps(
        steps: basicSteps,
        titleFontSize: 12,
        isStepLineDashed: true,
        dashFillRate: 0.5,
        subtitleFontSize: 6,
        leadingSizeFactor: 1.5,
      ),
    );
  }

  Widget customHorizontalStepsLine() {
    return SampleWrapper(
      title: 'Custom Horizontal Steps Line',
      widget: AppSteps(
        steps: customSteps0,
        showSubtitle: false,
        hideInactiveLeading: true,
        titleStyle: AppTextStyle.bold(size: 12),
      ),
    );
  }

  Widget customLeadingsAndStylesHorizontalStepsLineCustom() {
    return SampleWrapper(
      title: 'Custom Leadings & Styles Horizontal Steps',
      widget: AppSteps(
        steps: customSteps3,
        direction: Axis.horizontal,
        leadingSize: 40,
        leadingSizeFactor: 1,
        titleActiveColor: AppColors.primary,
        subtitleActiveColor: AppColors.primary,
        activeStepLineColor: AppColors.primary,
        titleFontSize: 12,
        subtitleFontSize: 8,
        showSubtitle: false,
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
          isStepLineContinuous: false,
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
          activeStepLineColor: AppColors.primary,
          dashFillRate: 1,
          stepLineRadius: 0,
          isStepLineContinuous: false,
        ),
      ),
    );
  }
}
