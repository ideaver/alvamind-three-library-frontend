import 'dart:math';

import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';
import '../../widget/molecule/app_chips.dart';
import 'sample_wrapper.dart';

class ChipsSamplesView extends StatefulWidget {
  const ChipsSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-chips-samples';

  @override
  State<ChipsSamplesView> createState() => _ChipsSamplesViewState();
}

class _ChipsSamplesViewState extends State<ChipsSamplesView> {
  bool isChip1Selected = true;
  bool isChip2Selected = false;
  bool isChip3Selected = false;

  List<Map<String, dynamic>> randomChips = [];

  @override
  void initState() {
    randomChips = List.generate(
      15,
      (i) => {
        'title': 'Chips $i',
        'is_selected': Random().nextBool(),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chips Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            selectedChips(),
            selectedChipsWithIcons(),
            selectedChipsWithIconsCustomStyle(),
            randomChipsWithWrapper(),
          ],
        ),
      ),
    );
  }

  Widget selectedChips() {
    return SampleWrapper(
      title: 'Chips',
      widget: AppChips(
        onTap: () {
          setState(() {
            isChip1Selected = !isChip1Selected;
          });
        },
        isSelected: isChip1Selected,
        text: 'Chips',
      ),
    );
  }

  Widget selectedChipsWithIcons() {
    return SampleWrapper(
      title: 'Chips With Icon',
      widget: AppChips(
        onTap: () {
          setState(() {
            isChip2Selected = !isChip2Selected;
          });
        },
        isSelected: isChip2Selected,
        text: 'Chips',
        leftIcon: Icons.star,
        rightIcon: Icons.close,
      ),
    );
  }

  Widget selectedChipsWithIconsCustomStyle() {
    return SampleWrapper(
      title: 'Chips With Icon Custom Style',
      widget: AppChips(
        onTap: () {
          setState(() {
            isChip3Selected = !isChip3Selected;
          });
        },
        isSelected: isChip3Selected,
        text: 'Chips',
        fontSize: 12,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        borderWidth: 1.5,
        leftIcon: Icons.star,
        rightIcon: Icons.close,
        selectedColor: AppColors.redLv1,
      ),
    );
  }

  Widget randomChipsWithWrapper() {
    return SampleWrapper(
      title: 'Random Chips With Wrapper',
      widget: Wrap(
        runSpacing: 8,
        spacing: 8,
        children: [
          ...List.generate(
            randomChips.length,
            (i) => AppChips(
              onTap: () {
                setState(() {
                  randomChips[i]['is_selected'] = !randomChips[i]['is_selected'];
                });
              },
              isSelected: randomChips[i]['is_selected'],
              text: randomChips[i]['title'],
              fontSize: 12,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              borderWidth: 1.5,
              leftIcon: Icons.star,
              rightIcon: Icons.close,
              selectedColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
