import 'package:flutter/material.dart';

import '../../app/const/countries.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../model/country_model.dart';
import '../../model/drop_down_model.dart';
import '../../widget/molecule/app_drop_down.dart';
import 'sample_wrapper.dart';

class DropDownSamplesView extends StatefulWidget {
  const DropDownSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-drop-down-samples';

  @override
  State<DropDownSamplesView> createState() => _DropDownSamplesViewState();
}

class _DropDownSamplesViewState extends State<DropDownSamplesView> {
  CountryModel _country = countries.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drop Down Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultDropDown(),
            defaultDropDownWithLabel(),
            defaultDropDownDisabled(),
            dropDownCustomIcons(),
            dropDownCustomItemsStyle(),
            dropDownCustomStyle(),
          ],
        ),
      ),
    );
  }

  Widget defaultDropDown() {
    return SampleWrapper(
      title: 'Default Drop Down',
      widget: AppDropDown(
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        hintText: 'Selec country...',
        selectedItem: _country.name,
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Text(
            item.text,
            style: AppTextStyle.semibold(size: 12),
          );
        },
      ),
    );
  }

  Widget defaultDropDownWithLabel() {
    return SampleWrapper(
      title: 'Default Drop Down With Label',
      widget: AppDropDown(
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        labelText: 'Country',
        hintText: 'Selec country...',
        selectedItem: _country.name,
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Text(
            item.text,
            style: AppTextStyle.semibold(size: 12),
          );
        },
      ),
    );
  }

  Widget defaultDropDownDisabled() {
    return SampleWrapper(
      title: 'Default Drop Down Disabled',
      widget: AppDropDown(
        enabled: false,
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        hintText: 'Selec country...',
        selectedItem: _country.name,
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Text(
            item.text,
            style: AppTextStyle.semibold(size: 12),
          );
        },
      ),
    );
  }

  Widget dropDownCustomIcons() {
    return SampleWrapper(
      title: 'Drop Down Custom Icons',
      widget: AppDropDown(
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        hintText: 'Selec country...',
        selectedItem: _country.name,
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.arrow_drop_down_circle,
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Text(
            item.text,
            style: AppTextStyle.semibold(size: 12),
          );
        },
      ),
    );
  }

  Widget dropDownCustomItemsStyle() {
    return SampleWrapper(
      title: 'Drop Down Custom Items Style',
      widget: AppDropDown(
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        hintText: 'Selec country...',
        selectedItem: _country.name,
        itemsBackgroundColor: AppColors.black,
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Row(
            children: [
              const Icon(Icons.check_box, size: 14, color: AppColors.white),
              const SizedBox(width: 6),
              Text(
                item.text,
                style: AppTextStyle.semibold(size: 12, color: AppColors.white),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget dropDownCustomStyle() {
    return SampleWrapper(
      title: 'Drop Down Custom Style',
      widget: AppDropDown(
        onTapItem: (item) {
          _country = countries.firstWhere((e) => e.countryCode == item.value);
        },
        hintText: 'Selec country...',
        selectedItem: _country.name,
        itemsBackgroundColor: AppColors.blueLv5,
        iconsColor: AppColors.primary,
        fillColor: AppColors.blueLv5,
        hintStyle: AppTextStyle.semibold(size: 14, color: AppColors.primary),
        textStyle: AppTextStyle.semibold(size: 14, color: AppColors.primary),
        items: List.generate(
          countries.length,
          (i) => DropDownModel(
              text: countries[i].name, value: countries[i].countryCode),
        ),
        itemsBuilder: (item) {
          return Row(
            children: [
              const Icon(Icons.check_box, size: 14, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                item.text,
                style:
                    AppTextStyle.semibold(size: 12, color: AppColors.primary),
              ),
            ],
          );
        },
      ),
    );
  }
}
