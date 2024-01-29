import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/steps_model.dart';

// AppSteps
// v.2.0.0
// by Elriz Wiraswara

class AppSteps extends StatelessWidget {
  final List<StepsModel> steps;
  final Axis direction;
  final CrossAxisAlignment crossAxisAlignment;
  final bool showCounter;
  final bool showSubtitle;
  final bool showStepLine;
  final bool hideInactiveLeading;
  final bool isStepLineDashed;
  final bool isStepLineContinuous;
  final Color activeColor;
  final Color inactiveColor;
  final Color titleActiveColor;
  final Color titleInactiveColor;
  final Color subtitleActiveColor;
  final Color subtitleInactiveColor;
  final Color activeStepLineColor;
  final Color inactiveStepLineColor;
  final double leadingSize;
  final double leadingSizeFactor;
  final double? titleFontSize;
  final double? subtitleFontSize;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double stepLineHeight;
  final double stepLineWidth;
  final double dashFillRate;
  final double stepLineRadius;

  const AppSteps({
    super.key,
    required this.steps,
    this.direction = Axis.horizontal,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.showCounter = true,
    this.showSubtitle = true,
    this.hideInactiveLeading = false,
    this.isStepLineDashed = false,
    this.showStepLine = true,
    this.isStepLineContinuous = true,
    this.activeColor = AppColors.primary,
    this.inactiveColor = AppColors.blackLv6,
    this.titleActiveColor = AppColors.blackLv1,
    this.titleInactiveColor = AppColors.blackLv5,
    this.subtitleActiveColor = AppColors.blackLv3,
    this.subtitleInactiveColor = AppColors.blackLv5,
    this.activeStepLineColor = AppColors.primary,
    this.inactiveStepLineColor = AppColors.blackLv6,
    this.leadingSize = 32,
    this.leadingSizeFactor = 2,
    this.titleFontSize,
    this.subtitleFontSize,
    this.titleStyle,
    this.subtitleStyle,
    this.stepLineHeight = 2,
    this.stepLineWidth = 2,
    this.dashFillRate = 0.7,
    this.stepLineRadius = 100,
  });

  @override
  Widget build(BuildContext context) {
    return direction == Axis.horizontal ? horizontalSteps() : verticalSteps();
  }

  Widget horizontalSteps() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(
          steps.length,
          (i) => i == (steps.length - 1)
              ? stepWidgetHorizontal(steps[i], i)
              : Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      stepWidgetHorizontal(steps[i], i),
                      stepLine(steps[i], i),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget verticalSteps() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
          steps.length,
          (i) => i == (steps.length - 1)
              ? stepWidgetVertical(steps[i], i)
              : Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      stepWidgetVertical(steps[i], i),
                      stepLine(steps[i], i),
                    ],
                  ),
                ),
        ),
      ],
    );
  }

  Widget stepLine(StepsModel step, int i) {
    if (!showStepLine) {
      return const SizedBox.shrink();
    }

    bool isActve = i == 0 ? steps[i].isActive : steps[i + 1].isActive;

    if (isStepLineDashed) {
      return dashedLine(isActve);
    } else {
      return solidLine(isActve);
    }
  }

  Widget dashedLine(bool isActive) {
    return Expanded(
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final boxSize = direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();
        final dCount = (boxSize * dashFillRate / stepLineWidth).floor();
        return SizedBox(
          width: direction == Axis.horizontal ? boxSize : leadingSize,
          height: direction == Axis.horizontal ? leadingSize : boxSize,
          child: Flex(
            // spaceBetween: the opposite of spaceAround on continuousStepLineDashed widget
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: direction,
            children: List.generate(dCount, (_) {
              return SizedBox(
                width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isActive ? activeStepLineColor : inactiveStepLineColor,
                    borderRadius: BorderRadius.circular(stepLineRadius),
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget solidLine(bool isActive) {
    return Expanded(
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
        final boxSize = direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();
        return Container(
          alignment: Alignment.center,
          width: direction == Axis.horizontal ? boxSize : leadingSize,
          height: direction == Axis.horizontal ? leadingSize : boxSize,
          child: SizedBox(
            width: direction == Axis.horizontal ? boxSize : stepLineHeight,
            height: direction == Axis.horizontal ? stepLineHeight : boxSize,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: isActive ? activeStepLineColor : inactiveStepLineColor,
              ),
            ),
          ),
        );
      }),
    );
  }

  // Line that connection leading widget with step line widget
  Widget continuousStepLine(StepsModel step, int i) {
    if (!showStepLine || !isStepLineContinuous) {
      return const SizedBox.shrink();
    }

    bool firstIsActive = steps[i].isActive;
    bool nextIsActive = i < steps.length - 1 ? steps[i + 1].isActive : steps[i].isActive;

    return SizedBox(
      width: direction == Axis.horizontal ? leadingSize * leadingSizeFactor : leadingSize,
      height: direction == Axis.horizontal ? leadingSize : leadingSize * leadingSizeFactor,
      child: isStepLineDashed
          ? continuousStepLineDashed(firstIsActive, nextIsActive, i)
          : continuousStepLineSolid(firstIsActive, nextIsActive, i),
    );
  }

  Widget continuousStepLineDashed(bool firstIsActive, bool nextIsActive, int i) {
    return direction == Axis.horizontal
        ? Row(
            children: [
              Expanded(
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  final boxSize =
                      direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();

                  // if dashFillRate < 1 divide by 2, so that the density is the same as the density of dashedLine widget
                  final dCount =
                      (boxSize * (dashFillRate == 1 ? dashFillRate : dashFillRate / 2) / stepLineWidth).ceil();
                  return Flex(
                    // spaceAround: the opposite of spaceBetween on dashedLine widget
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: direction,
                    children: List.generate(dCount, (_) {
                      return SizedBox(
                        width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                        height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            // hide first line with transparent color
                            color: i == 0
                                ? AppColors.transparent
                                : (firstIsActive ? activeStepLineColor : inactiveStepLineColor),
                            borderRadius: BorderRadius.circular(stepLineRadius),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
              Expanded(
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  final boxSize =
                      direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();

                  // if dashFillRate < 1 divide by 2, so that the density is the same as the density of dashedLine widget
                  final dCount =
                      (boxSize * (dashFillRate == 1 ? dashFillRate : dashFillRate / 2) / stepLineWidth).ceil();
                  return Flex(
                    // spaceAround: the opposite of spaceBetween on dashedLine widget
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: direction,
                    children: List.generate(dCount, (_) {
                      return SizedBox(
                        width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                        height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            // hide last line with transparent color
                            color: i == steps.length - 1
                                ? AppColors.transparent
                                : (nextIsActive ? activeStepLineColor : inactiveStepLineColor),
                            borderRadius: BorderRadius.circular(stepLineRadius),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  final boxSize =
                      direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();

                  // if dashFillRate < 1 divide by 2, so that the density is the same as the density of dashedLine widget
                  final dCount =
                      (boxSize * (dashFillRate == 1 ? dashFillRate : dashFillRate / 2) / stepLineWidth).ceil();
                  return Flex(
                    // spaceAround: the opposite of spaceBetween on dashedLine widget
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: direction,
                    children: List.generate(dCount, (_) {
                      return SizedBox(
                        width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                        height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            // hide first line with transparent color
                            color: i == 0
                                ? AppColors.transparent
                                : (firstIsActive ? activeStepLineColor : inactiveStepLineColor),
                            borderRadius: BorderRadius.circular(stepLineRadius),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
              Expanded(
                child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
                  final boxSize =
                      direction == Axis.horizontal ? constraints.constrainWidth() : constraints.constrainHeight();

                  // if dashFillRate < 1 divide by 2, so that the density is the same as the density of dashedLine widget
                  final dCount =
                      (boxSize * (dashFillRate == 1 ? dashFillRate : dashFillRate / 2) / stepLineWidth).ceil();
                  return Flex(
                    // spaceAround: the opposite of spaceBetween on dashedLine widget
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    direction: direction,
                    children: List.generate(dCount, (_) {
                      return SizedBox(
                        width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                        height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            // hide last line with transparent color
                            color: i == steps.length - 1
                                ? AppColors.transparent
                                : (nextIsActive ? activeStepLineColor : inactiveStepLineColor),
                            borderRadius: BorderRadius.circular(stepLineRadius),
                          ),
                        ),
                      );
                    }),
                  );
                }),
              ),
            ],
          );
  }

  Widget continuousStepLineSolid(bool firstIsActive, bool nextIsActive, int i) {
    return direction == Axis.horizontal
        ? Row(
            children: [
              Expanded(
                child: Container(
                  // hide first line with transparent color
                  color: i == 0 ? AppColors.transparent : (firstIsActive ? activeStepLineColor : inactiveStepLineColor),
                  width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                  height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                ),
              ),
              Expanded(
                child: Container(
                  // hide last line with transparent color
                  color: i == steps.length - 1
                      ? AppColors.transparent
                      : (nextIsActive ? activeStepLineColor : inactiveStepLineColor),
                  width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                  height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                ),
              ),
            ],
          )
        : Column(
            children: [
              Expanded(
                child: Container(
                  // hide first line with transparent color
                  color: i == 0 ? AppColors.transparent : (firstIsActive ? activeStepLineColor : inactiveStepLineColor),
                  width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                  height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                ),
              ),
              Expanded(
                child: Container(
                  // hide last line with transparent color
                  color: i == steps.length - 1
                      ? AppColors.transparent
                      : (nextIsActive ? activeStepLineColor : inactiveStepLineColor),
                  width: direction == Axis.horizontal ? stepLineWidth : stepLineHeight,
                  height: direction == Axis.horizontal ? stepLineHeight : stepLineWidth,
                ),
              ),
            ],
          );
  }

  Widget stepWidgetHorizontal(StepsModel step, int i) {
    return SizedBox(
      width: leadingSize * leadingSizeFactor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leadingWidget(step, i),
          titleWidgetStepHorizontal(step),
          subtitleWidgetStepHorizontal(step),
        ],
      ),
    );
  }

  Widget titleWidgetStepHorizontal(StepsModel step) {
    if (step.title == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4, top: AppSizes.padding / 2),
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
    );
  }

  Widget subtitleWidgetStepHorizontal(StepsModel step) {
    if (!showSubtitle || step.subtitle == null) {
      return const SizedBox.shrink();
    }

    return Text(
      step.subtitle!,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: subtitleStyle ??
          AppTextStyle.medium(
            size: subtitleFontSize ?? leadingSize / 2.6,
            color: step.isActive ? subtitleActiveColor : subtitleInactiveColor,
          ),
    );
  }

  Widget stepWidgetVertical(StepsModel step, int i) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leadingWidget(step, i),
        step.title == null && step.subtitle == null
            ? const SizedBox.shrink()
            : Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidgetStepVertical(step),
                    subtitleWidgetStepVertical(step),
                  ],
                ),
              ),
      ],
    );
  }

  Widget titleWidgetStepVertical(StepsModel step) {
    if (step.title == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        step.title!,
        style: titleStyle ??
            AppTextStyle.bold(
              size: titleFontSize ?? leadingSize / 2,
              color: step.isActive ? titleActiveColor : titleInactiveColor,
            ),
      ),
    );
  }

  Widget subtitleWidgetStepVertical(StepsModel step) {
    if (!showSubtitle || step.subtitle == null) {
      return const SizedBox.shrink();
    }

    return Text(
      step.subtitle!,
      style: subtitleStyle ??
          AppTextStyle.medium(
            size: subtitleFontSize ?? leadingSize / 2.6,
            color: step.isActive ? subtitleActiveColor : subtitleInactiveColor,
          ),
    );
  }

  Widget leadingWidget(StepsModel step, int i) {
    return SizedBox(
      width: direction == Axis.horizontal ? leadingSize * leadingSizeFactor : leadingSize,
      height: direction == Axis.horizontal ? leadingSize : leadingSize * leadingSizeFactor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Line that connection leading widget with step line widget
          continuousStepLine(step, i),
          if (step.leading != null)
            // Custom leading
            Center(
              child: hideInactiveLeading
                  ? step.isActive
                      ? SizedBox(
                          width: leadingSize,
                          height: leadingSize,
                          child: step.leading,
                        )
                      : Container(
                          width: leadingSize / 1.5,
                          height: leadingSize / 1.5,
                          decoration: BoxDecoration(
                            color: inactiveColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: AppColors.white,
                            ),
                          ),
                        )
                  : SizedBox(
                      width: leadingSize,
                      height: leadingSize,
                      child: step.leading,
                    ),
            )
          else
            // Default leading
            Container(
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
            )
        ],
      ),
    );
  }
}
