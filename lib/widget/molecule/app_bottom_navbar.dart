import 'package:flutter/material.dart';

import '../../../app/theme/app_colors.dart';
import '../../../app/theme/app_shadows.dart';
import '../../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/bottom_navbar_model.dart';

class AppBottomNavbar extends StatelessWidget {
  final List<Widget> pageList;
  final List<BottomNavbarModel> buttonList;
  final double? barHeight;
  final double backgroundHeight;
  final double fontSize;
  final double iconSize;
  final double borderRadius;
  final EdgeInsets padding;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final void Function(int) onTapButton;
  final int selectedIndex;

  const AppBottomNavbar({
    super.key,
    required this.pageList,
    required this.buttonList,
    this.barHeight,
    this.backgroundHeight = 80,
    this.fontSize = 12,
    this.iconSize = 20,
    this.borderRadius = AppSizes.radius * 2,
    this.padding = const EdgeInsets.symmetric(
        horizontal: AppSizes.padding / 2, vertical: AppSizes.padding),
    this.backgroundColor = AppColors.white,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.blackLv6,
    required this.onTapButton,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[selectedIndex],
      bottomNavigationBar: SizedBox(
        // height: barHeight,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: barHeight ?? backgroundHeight,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                boxShadow: [AppShadows.darkShadow4Reversed],
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
            ),
            Padding(
              padding: padding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ...List.generate(buttonList.length, (i) {
                    return Expanded(
                      child: InkWell(
                        splashColor: AppColors.transparent,
                        highlightColor: AppColors.transparent,
                        onTap: () {
                          onTapButton(i);
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            selectedIndex == i
                                ? buttonList[i].activeIconButton ??
                                    Icon(
                                      buttonList[i].activeIcon ??
                                          buttonList[i].inactiveIcon,
                                      color: activeColor,
                                      size: iconSize,
                                    )
                                : buttonList[i].inactiveIconButton ??
                                    buttonList[i].activeIconButton ??
                                    Icon(
                                      buttonList[i].inactiveIcon ??
                                          buttonList[i].activeIcon,
                                      color: inactiveColor,
                                      size: iconSize,
                                    ),
                            const SizedBox(height: AppSizes.padding / 4),
                            buttonList[i].title != null
                                ? Text(
                                    buttonList[i].title ?? '',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: AppTextStyle.custom(
                                      size: fontSize,
                                      fontWeight: selectedIndex == i
                                          ? AppFontWeight.bold
                                          : AppFontWeight.medium,
                                      color: selectedIndex == i
                                          ? activeColor
                                          : inactiveColor,
                                    ),
                                  )
                                : const SizedBox.shrink()
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
