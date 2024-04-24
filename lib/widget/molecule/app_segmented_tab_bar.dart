import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/tab_bar_model.dart';

class AppSegmentedTabBar extends StatefulWidget {
  final TabController? tabController;
  final List<TabBarModel> tabs;
  final Color backgroundColor;
  final Color indicatorColor;
  final Color borderColor;
  final Color labelColor;
  final Color iconColor;
  final Color activeLabelColor;
  final Color activeIconColor;
  final double iconSize;
  final double labelFontSize;
  final double borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final EdgeInsets indicatorPadding;
  final int? selectedTabIndex;
  final Function(int)? onChangedTab;

  const AppSegmentedTabBar({
    super.key,
    this.tabController,
    required this.tabs,
    this.backgroundColor = AppColors.white,
    this.indicatorColor = AppColors.blackLv9,
    this.borderColor = AppColors.blackLv8,
    this.labelColor = AppColors.black,
    this.iconColor = AppColors.black,
    this.activeLabelColor = AppColors.black,
    this.activeIconColor = AppColors.black,
    this.iconSize = 16,
    this.labelFontSize = 14,
    this.borderRadius = AppSizes.radius,
    this.margin = const EdgeInsets.only(top: AppSizes.padding, bottom: AppSizes.padding * 1.5),
    this.padding = const EdgeInsets.all(4),
    this.indicatorPadding = EdgeInsets.zero,
    this.selectedTabIndex,
    this.onChangedTab,
  });

  @override
  State<AppSegmentedTabBar> createState() => _AppSegmentedTabBarState();
}

class _AppSegmentedTabBarState extends State<AppSegmentedTabBar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    if (widget.tabController == null) {
      tabController = TabController(length: widget.tabs.length, vsync: this);
    } else {
      tabController = widget.tabController!;
    }

    tabController.addListener(tabListener);

    if (widget.selectedTabIndex != null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        tabController.animateTo(widget.selectedTabIndex!);
      });
    }

    super.initState();
  }

  void tabListener() {
    if (widget.onChangedTab != null) {
      widget.onChangedTab!(tabController.index);
    }

    if (mounted) setState(() {});
  }

  // @override
  // void dispose() {
  //   tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(width: 1, color: widget.borderColor),
      ),
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          color: widget.indicatorColor,
          borderRadius: BorderRadius.circular(widget.borderRadius - 4),
        ),
        splashFactory: NoSplash.splashFactory,
        padding: widget.padding,
        indicatorPadding: widget.indicatorPadding,
        tabs: List.generate(widget.tabs.length, (i) {
          return Tab(child: tabWidget(i));
        }),
      ),
    );
  }

  Widget tabWidget(int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        widget.tabs[i].icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: AppSizes.padding / 3),
                child: Icon(
                  widget.tabs[i].icon,
                  size: widget.iconSize,
                  color: tabController.index == i ? widget.activeLabelColor : widget.iconColor,
                ),
              )
            : const SizedBox.shrink(),
        widget.tabs[i].label != null
            ? Flexible(
                child: Text(
                  widget.tabs[i].label ?? '',
                  // maxLines: 1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: AppTextStyle.bold(
                    size: widget.labelFontSize,
                    color: tabController.index == i ? widget.activeLabelColor : widget.labelColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
