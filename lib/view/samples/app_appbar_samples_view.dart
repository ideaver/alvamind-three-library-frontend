import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/tab_bar_model.dart';
import '../../widget/atom/app_avatar.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_appbar.dart';
import '../../widget/molecule/app_icon_button.dart';
import '../../widget/molecule/app_segmented_tab_bar.dart';
import '../../widget/molecule/app_text_field.dart';
import '___sample_wrapper.dart';

class AppAppbarSamplesView extends StatefulWidget {
  const AppAppbarSamplesView({super.key});

  static const routeName = '/molecule-app-appbar';

  @override
  State<AppAppbarSamplesView> createState() => _AppAppbarSamplesViewState();
}

class _AppAppbarSamplesViewState extends State<AppAppbarSamplesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLv9,
      appBar: AppBar(title: const Text('App Bar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultAppbar(),
            defaultAppbarCenterTitle(),
            defaultAppbarCenterTitleWithActions(),
            defaultAppbarCenterTitleWithCustomLeadingAndActions(),
            customAppbarTitleWidget(),
            customAppbarColor(),
            customAppbarWithBottomWidget(),
          ],
        ),
      ),
    );
  }

  Widget defaultAppbar() {
    return const SampleWrapper(
      title: 'Default Appbar',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
      ),
    );
  }

  Widget defaultAppbarCenterTitle() {
    return const SampleWrapper(
      title: 'Default Appbar Center Title',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
        centerTitle: true,
      ),
    );
  }

  Widget defaultAppbarCenterTitleWithActions() {
    return SampleWrapper(
      title: 'Default Appbar Center Title With Actions',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
        centerTitle: true,
        actions: [
          AppIconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            iconButtonColor: AppColors.transparent,
            borderColor: AppColors.blackLv9,
            borderWidth: 1,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget defaultAppbarCenterTitleWithCustomLeadingAndActions() {
    return SampleWrapper(
      title: 'Default Appbar Center Title With Custom Leading & Actions',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
        centerTitle: true,
        leading: const AppAvatar(
          image: randomImage,
          size: 34,
        ),
        actions: [
          AppIconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            iconButtonColor: AppColors.transparent,
            borderColor: AppColors.blackLv9,
            borderWidth: 1,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget customAppbarTitleWidget() {
    return const SampleWrapper(
      title: 'Custom Appbar TitleWidget',
      widget: AppAppbar(
        titlePadding: EdgeInsets.only(left: AppSizes.padding),
        titleWidget: AppTextField(
          type: AppTextFieldType.search,
          hintText: 'Search',
          rounded: false,
          borderRadius: AppSizes.padding,
        ),
      ),
    );
  }

  Widget customAppbarColor() {
    return SampleWrapper(
      title: 'Custom Appbar Color',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
        centerTitle: false,
        backgroundColor: AppColors.black,
        titleTextStyle: AppTextStyle.heading6(color: AppColors.white),
        subtitleTextStyle: AppTextStyle.bodyXSmall(fontWeight: AppFontWeight.medium, color: AppColors.white),
        leading: const AppAvatar(
          image: randomImage,
          size: 34,
        ),
        actions: [
          AppIconButton(
            icon: const Icon(Icons.person_2_outlined, color: AppColors.white),
            iconButtonColor: AppColors.transparent,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
          const SizedBox(width: AppSizes.padding / 2),
          AppIconButton(
            icon: const Icon(Icons.notifications_active_outlined, color: AppColors.white),
            iconButtonColor: AppColors.transparent,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget customAppbarWithBottomWidget() {
    return SampleWrapper(
      title: 'Custom Appbar With Bottom Widget',
      widget: AppAppbar(
        title: 'App Bar Title',
        subtitle: 'App Bar Subtitle',
        centerTitle: false,
        leading: const AppAvatar(
          image: randomImage,
          size: 34,
        ),
        actions: [
          AppIconButton(
            icon: const Icon(Icons.person_2_outlined),
            iconButtonColor: AppColors.transparent,
            borderColor: AppColors.blackLv9,
            borderWidth: 1,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
          const SizedBox(width: AppSizes.padding / 2),
          AppIconButton(
            icon: const Icon(Icons.notifications_active_outlined),
            iconButtonColor: AppColors.transparent,
            borderColor: AppColors.blackLv9,
            borderWidth: 1,
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
        ],
        bottom: AppSegmentedTabBar(
          margin: EdgeInsets.zero,
          borderRadius: 0,
          tabs: [
            TabBarModel(label: 'Tab 1'),
            TabBarModel(label: 'Tab 2'),
          ],
        ),
      ),
    );
  }
}
