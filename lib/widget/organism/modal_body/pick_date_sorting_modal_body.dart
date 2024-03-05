import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:alvamind_three_library_frontend/app/utility/date_formatter.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_button.dart';
import 'package:alvamind_three_library_frontend/widget/molecule/app_radio_list_tile.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import '../../../model/date_sorting_model.dart';

class PickDateSortingModalBody extends StatefulWidget {
  final List<DateSortingModel> specifiedDateRanges;
  final bool enableCustomDateRange;
  final Function(List<DateTime>)? onTapApply;

  const PickDateSortingModalBody({
    super.key,
    required this.specifiedDateRanges,
    this.enableCustomDateRange = false,
    this.onTapApply,
  });

  @override
  State<PickDateSortingModalBody> createState() => _PickDateSortingModalBodyState();
}

class _PickDateSortingModalBodyState extends State<PickDateSortingModalBody> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...radioList(),
        customDateRangeRadio(),
        const SizedBox(height: AppSizes.padding),
        applyButton(),
      ],
    );
  }

  List<Widget> radioList() {
    return List.generate(widget.specifiedDateRanges.length, (i) {
      return Padding(
        padding: const EdgeInsets.only(bottom: AppSizes.padding),
        child: AppRadioListTile(
          value: i,
          groupValue: selectedOption,
          title: widget.specifiedDateRanges[i].title,
          subtitle: subtitle(widget.specifiedDateRanges[i].days),
          subtitleStyle: AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
          onChanged: (value) {
            selectedOption = value as int;
            setState(() {});
          },
        ),
      );
    });
  }

  Widget customDateRangeRadio() {
    if (!widget.enableCustomDateRange) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.padding),
      child: AppRadioListTile(
        value: widget.specifiedDateRanges.length + 1,
        groupValue: selectedOption,
        title: 'Pilih Tanggal',
        subtitle: 'Pilih rentang tanggal custom',
        subtitleStyle: AppTextStyle.bodySmall(fontWeight: AppFontWeight.regular),
        onChanged: (value) {
          selectedOption = value as int;
          setState(() {});
        },
      ),
    );
  }

  List<DateTime> dateRangeValue(int days) {
    return List<DateTime>.generate(days, (i) {
      return DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ).subtract(Duration(days: i));
    }).reversed.toList();
  }

  String subtitle(int days) {
    List<DateTime> dates = dateRangeValue(days);

    if (dates.length > 1) {
      return '${DateFormatter.normal(dates.first.toIso8601String())} - ${DateFormatter.normal(dates.last.toIso8601String())}';
    }

    return DateFormatter.normal(dates.first.toIso8601String());
  }

  Widget applyButton() {
    return AppButton(
      text: 'Terapkan',
      onTap: () async {
        if (widget.onTapApply == null) {
          return;
        }

        if (selectedOption == -1) {
          return;
        }

        if (selectedOption < widget.specifiedDateRanges.length) {
          widget.onTapApply!(dateRangeValue(widget.specifiedDateRanges[selectedOption].days));
          Navigator.pop(context);
        } else {
          await customDateRanges();
        }
      },
    );
  }

  Future<void> customDateRanges() async {
    Navigator.pop(context);

    var dates = await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        lastDate: DateTime.now(),
        calendarType: CalendarDatePicker2Type.range,
      ),
      dialogSize: const Size(325, 400),
      borderRadius: BorderRadius.circular(15),
    );

    if (dates == null) {
      return;
    }

    List<DateTime> ranges = dateRangeValue(
      DateTimeRange(
        start: (dates.first ?? DateTime.now()).subtract(const Duration(days: 1)),
        end: dates.last ?? DateTime.now(),
      ).duration.inDays,
    );

    widget.onTapApply!(ranges);
  }
}
