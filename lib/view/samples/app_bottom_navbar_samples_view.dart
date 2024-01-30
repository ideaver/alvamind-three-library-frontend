import 'package:flutter/material.dart';

import '../../app/asset/app_icons.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_shadows.dart';
import '../../app/theme/app_sizes.dart';
import '../../model/bottom_navbar_model.dart';
import '../../widget/atom/app_avatar.dart';
import '../../widget/atom/app_image.dart';
import '../../widget/molecule/app_bottom_navbar.dart';
import '___sample_wrapper.dart';

class AppBottomNavbarSamplesView extends StatefulWidget {
  const AppBottomNavbarSamplesView({super.key});

  static const routeName = '/molecule-app-bottom-navbar';

  @override
  State<AppBottomNavbarSamplesView> createState() => _AppBottomNavbarSamplesViewState();
}

class _AppBottomNavbarSamplesViewState extends State<AppBottomNavbarSamplesView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackLv9,
      appBar: AppBar(title: const Text('Bottom Navbar Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultBottomNavbar(),
            bottomNavbarWithCustomIcon(),
            customBottomNavbar(),
          ],
        ),
      ),
    );
  }

  Widget defaultBottomNavbar() {
    return SampleWrapper(
      title: 'Bottom Navbar',
      widget: SizedBox(
        height: 200,
        child: AppBottomNavbar(
          selectedIndex: selectedIndex,
          pageList: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
            Center(child: Text('Page 4')),
            Center(child: Text('Page 5')),
          ],
          buttonList: [
            BottomNavbarModel(
              title: 'Title 1',
              activeIcon: AppIcons.Home,
            ),
            BottomNavbarModel(
              title: 'Title 2',
              activeIcon: AppIcons.Activity,
            ),
            BottomNavbarModel(
              title: 'Title 3',
              activeIcon: AppIcons.Paper,
            ),
            BottomNavbarModel(
              title: 'Title 4',
              activeIcon: AppIcons.Category,
            ),
            BottomNavbarModel(
              title: 'Title 5',
              activeIcon: AppIcons.Setting,
            ),
          ],
          onTapButton: (i) {
            selectedIndex = i;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget bottomNavbarWithCustomIcon() {
    return SampleWrapper(
      title: 'Bottom Navbar With Custom Icon',
      widget: SizedBox(
        height: 200,
        child: AppBottomNavbar(
          selectedIndex: selectedIndex,
          pageList: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
            Center(child: Text('Page 4')),
            Center(child: Text('Page 5')),
          ],
          buttonList: [
            BottomNavbarModel(
              title: 'Title 1',
              activeIcon: AppIcons.Home,
            ),
            BottomNavbarModel(
              title: 'Title 2',
              activeIcon: AppIcons.Activity,
            ),
            BottomNavbarModel(
              title: 'Title 3',
              activeIcon: AppIcons.Paper,
              activeIconButton: Container(
                padding: const EdgeInsets.all(AppSizes.padding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [AppShadows.primaryShadow5],
                ),
                child: const Icon(
                  AppIcons.Paper,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
            BottomNavbarModel(
              title: 'Title 4',
              activeIcon: AppIcons.Category,
            ),
            BottomNavbarModel(
              title: 'Title 5',
              activeIconButton: const AppAvatar(
                size: 20,
                image: randomImage,
                enabled: false,
              ),
            ),
          ],
          onTapButton: (i) {
            selectedIndex = i;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget customBottomNavbar() {
    return SampleWrapper(
      title: 'Custom Bottom Navbar',
      widget: SizedBox(
        height: 200,
        child: AppBottomNavbar(
          selectedIndex: selectedIndex,
          barHeight: 65,
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 4, vertical: AppSizes.padding / 1.5),
          activeColor: AppColors.white,
          inactiveColor: AppColors.blackLv6,
          backgroundColor: AppColors.black,
          pageList: const [
            Center(child: Text('Page 1')),
            Center(child: Text('Page 2')),
            Center(child: Text('Page 3')),
            Center(child: Text('Page 4')),
            Center(child: Text('Page 5')),
          ],
          buttonList: [
            BottomNavbarModel(
              title: 'Title 1',
              activeIcon: AppIcons.Home,
              inactiveIcon: AppIcons.home2,
            ),
            BottomNavbarModel(
              title: 'Title 2',
              activeIcon: AppIcons.Activity,
              inactiveIcon: AppIcons.stats_bars,
            ),
            BottomNavbarModel(
              title: 'Title 3',
              activeIcon: AppIcons.Paper,
              activeIconButton: Container(
                padding: const EdgeInsets.all(AppSizes.padding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                  boxShadow: [AppShadows.primaryShadow5],
                ),
                child: const Icon(
                  AppIcons.Paper,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              inactiveIconButton: Container(
                padding: const EdgeInsets.all(AppSizes.padding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                  boxShadow: [AppShadows.primaryShadow5],
                ),
                child: const Icon(
                  AppIcons.Paper,
                  color: AppColors.white,
                  size: 24,
                ),
              ),
            ),
            BottomNavbarModel(
              title: 'Title 4',
              activeIcon: AppIcons.Category,
              inactiveIcon: AppIcons.Menu,
            ),
            BottomNavbarModel(
              title: 'Title 5',
              activeIcon: AppIcons.Setting,
              inactiveIcon: AppIcons.hammer,
            ),
          ],
          onTapButton: (i) {
            selectedIndex = i;
            setState(() {});
          },
        ),
      ),
    );
  }
}
