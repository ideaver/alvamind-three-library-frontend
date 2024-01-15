import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/steps_model.dart';

class AppSteps extends StatelessWidget {
  final List<StepsModel> steps;
  final Axis direction;
  final bool showCounter;
  final bool showSubtitle;
  final Color activeColor;
  final Color inactiveColor;
  final Color titleActiveColor;
  final Color titleInactiveColor;
  final Color subtitleActiveColor;
  final Color subtitleInactiveColor;
  final Color activeDashColor;
  final Color inactiveDashColor;
  final double leadingSize;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double dashHeight;
  final double dashWith;
  final double dashFillRate;
  final double dashRadius;

  const AppSteps({
    Key? key,
    required this.steps,
    this.direction = Axis.horizontal,
    this.showCounter = false,
    this.showSubtitle = true,
    this.activeColor = AppColors.greenLv1,
    this.inactiveColor = AppColors.blackLv6,
    this.titleActiveColor = AppColors.blackLv1,
    this.titleInactiveColor = AppColors.blackLv5,
    this.subtitleActiveColor = AppColors.blackLv3,
    this.subtitleInactiveColor = AppColors.blackLv5,
    this.activeDashColor = AppColors.blackLv6,
    this.inactiveDashColor = AppColors.blackLv6,
    this.leadingSize = 32,
    this.titleFontSize,
    this.subtitleFontSize,
    this.titleStyle,
    this.subtitleStyle,
    this.dashHeight = 2,
    this.dashWith = 4,
    this.dashFillRate = 0.7,
    this.dashRadius = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: direction == Axis.horizontal
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  steps.length,
                  (i) => i == (steps.length - 1)
                      ? stepHorizontal(steps[i], i)
                      : Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              stepHorizontal(steps[i], i),
                              dashLine(i, steps[i].isActive),
                            ],
                          ),
                        ),
                ),
              ],
            )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  steps.length,
                  (i) => i == (steps.length - 1)
                      ? stepVertical(steps[i], i)
                      : Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              stepVertical(steps[i], i),
                              dashLine(i, steps[i].isActive),
                            ],
                          ),
                        ),
                ),
              ],
            ),
    );
  }

  Widget dashLine(int i, bool isActive) {
    return Expanded(
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final boxSize = direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();
        final dCount = (boxSize * dashFillRate / dashWith).floor();
        return SizedBox(
          width: direction == Axis.horizontal ? boxSize : leadingSize,
          height: direction == Axis.horizontal ? leadingSize : boxSize,
          child: Flex(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: direction,
            children: List.generate(dCount, (_) {
              return SizedBox(
                width: direction == Axis.horizontal ? dashWith : dashHeight,
                height: direction == Axis.horizontal ? dashHeight : dashWith,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? activeDashColor : inactiveDashColor,
                    borderRadius: BorderRadius.circular(dashRadius),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget stepHorizontal(StepsModel step, int i) {
    return Container(
      width: leadingSize * 1.5,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        children: [
          leadingWidget(step, i),
          step.title != null
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 4, top: 14),
                  child: Text(
                    step.title!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: titleStyle ??
                        AppTextStyle.bold(
                          size: titleFontSize ?? leadingSize / 2,
                          color: step.isActive ? titleActiveColor : titleInactiveColor,
                        ),
                  ),
                )
              : const SizedBox.shrink(),
          showSubtitle && step.subtitle != null
              ? Text(
                  step.subtitle!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: subtitleStyle ??
                      AppTextStyle.medium(
                        size: subtitleFontSize ?? leadingSize / 2.6,
                        color: step.isActive ? subtitleActiveColor : subtitleInactiveColor,
                      ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget stepVertical(StepsModel step, int i) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          leadingWidget(step, i),
          step.title != null && step.subtitle != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      step.title != null
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                step.title!,
                                style: titleStyle ??
                                    AppTextStyle.bold(
                                      size: titleFontSize ?? leadingSize / 2,
                                      color: step.isActive ? titleActiveColor : titleInactiveColor,
                                    ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      showSubtitle && step.subtitle != null
                          ? Text(
                              step.subtitle!,
                              style: subtitleStyle ??
                                  AppTextStyle.medium(
                                    size: subtitleFontSize ?? leadingSize / 2.6,
                                    color: step.isActive ? subtitleActiveColor : subtitleInactiveColor,
                                  ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget leadingWidget(StepsModel step, int i) {
    if (step.leading != null) {
      return SizedBox(
        width: leadingSize,
        height: leadingSize,
        child: Center(child: step.leading),
      );
    }

    return Container(
      width: leadingSize,
      height: leadingSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: leadingSize / 12, color: step.isActive ? activeColor : inactiveColor),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: leadingSize / (showCounter ? 0 : 2),
        height: leadingSize / (showCounter ? 0 : 2),
        decoration: BoxDecoration(
          color: step.isActive ? activeColor : inactiveColor,
          shape: BoxShape.circle,
        ),
        child: showCounter
            ? Center(
                child: Text(
                  '${i + 1}',
                  style: AppTextStyle.bold(
                    size: leadingSize / 2.5,
                    color: AppColors.white,
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
