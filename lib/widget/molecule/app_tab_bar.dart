import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/tab_bar_model.dart';

class AppTabBar extends StatefulWidget {
  final TabController? tabController;
  final List<TabBarModel> tabs;
  final Color backgroundColor;
  final Color indicatorColor;
  final double borderRadius;
  final EdgeInsets margin;
  final Function(int)? onChangedTab;

  const AppTabBar({
    super.key,
    this.tabController,
    required this.tabs,
    this.backgroundColor = AppColors.white,
    this.indicatorColor = AppColors.blackLv9,
    this.borderRadius = AppSizes.radius,
    this.margin = const EdgeInsets.only(top: AppSizes.padding, bottom: AppSizes.padding * 1.5),
    this.onChangedTab,
  });

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    if (widget.tabController == null) {
      tabController = TabController(length: widget.tabs.length, vsync: this);
      tabController.addListener(tabListener);
    } else {
      tabController = widget.tabController!;
    }
    super.initState();
  }

  void tabListener() {
    if (widget.onChangedTab != null) {
      widget.onChangedTab!(tabController.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(width: 1, color: AppColors.blackLv8),
      ),
      child: TabBar(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        indicator: BoxDecoration(
          color: widget.indicatorColor,
          borderRadius: BorderRadius.circular(widget.borderRadius - 4),
        ),
        tabs: [
          ...List.generate(widget.tabs.length, (i) {
            return Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.tabs[i].icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: AppSizes.padding / 3),
                          child: Icon(
                            widget.tabs[i].icon,
                            size: 16,
                            color: AppColors.black,
                          ),
                        )
                      : const SizedBox.shrink(),
                  widget.tabs[i].label != null
                      ? Flexible(
                          child: Text(
                            widget.tabs[i].label ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.bold(size: 14),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
