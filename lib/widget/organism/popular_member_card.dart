import 'package:flutter/material.dart';

import '../../app/theme/app_sizes.dart';
import '../molecule/app_statistic_square.dart';

class PopularMemberCard extends StatelessWidget {
  final List<AppStatisticSquare> statisticSquares;
  final double childAspectRatio;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const PopularMemberCard({
    super.key,
    required this.statisticSquares,
    this.childAspectRatio = 1,
    this.maxCrossAxisExtent = 200,
    this.mainAxisSpacing = AppSizes.padding,
    this.crossAxisSpacing = AppSizes.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: childAspectRatio,
        maxCrossAxisExtent: maxCrossAxisExtent,
        mainAxisSpacing: AppSizes.padding,
        crossAxisSpacing: AppSizes.padding,
      ),
      itemCount: statisticSquares.length,
      shrinkWrap: true,
      itemBuilder: (_, index) => statisticSquares[index],
    );
  }
}
