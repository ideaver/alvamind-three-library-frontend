import 'package:alvamind_three_library_frontend/model/tab_bar_model.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_avatar.dart';
import 'package:alvamind_three_library_frontend/widget/atom/app_image.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_icon_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_segmented_tab_bar.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../widget/molecule/app_appbar.dart';
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
          ],
        ),
      ),
    );
  }

  Widget defaultAppbar() {
    return SampleWrapper(
      title: 'Default Appbar',
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
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
          AppIconButton(
            icon: const Icon(Icons.keyboard_arrow_left_rounded),
            padding: const EdgeInsets.all(AppSizes.padding / 4),
            onTap: () {},
          ),
        ],
        appBarHeight: 120,
        bottom: AppSegmentedTabBar(
          margin: EdgeInsets.zero,
          borderRadius: 0,
          tabs: [
            TabBarModel(label: 'asd'),
            TabBarModel(label: 'asd'),
          ],
        ),
      ),
    );
  }
}
