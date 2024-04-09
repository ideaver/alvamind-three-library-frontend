import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class AppTimePicker extends StatefulWidget {
  final TimeOfDay? initialValue;
  final Function(TimeOfDay) onChangeWheel;

  const AppTimePicker({
    super.key,
    this.initialValue,
    required this.onChangeWheel,
  });

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  late TimeOfDay selectedTime;

  DayPeriod selectedPeriod = DayPeriod.am;

  late WheelPickerController hoursWheel;

  late WheelPickerController minutesWheel;

  final wheelStyle = const WheelPickerStyle(
    size: 200,
    squeeze: 1.25,
    diameterRatio: .8,
    surroundingOpacity: .25,
    magnification: 1,
    itemExtent: 34,
  );

  @override
  void initState() {
    selectedTime = widget.initialValue ?? TimeOfDay.now();
    selectedPeriod = widget.initialValue?.period ?? TimeOfDay.now().period;

    hoursWheel = WheelPickerController(
      itemCount: 12,
      initialIndex: selectedTime.hour - (selectedPeriod == DayPeriod.pm ? 12 : 0),
    );

    minutesWheel = WheelPickerController(
      itemCount: 60,
      initialIndex: selectedTime.minute,
      mounts: [hoursWheel],
    );

    // cl("init === $selectedTime ${selectedPeriod.name}");

    super.initState();
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WheelPicker(
          builder: itemBuilder,
          controller: hoursWheel,
          looping: false,
          style: wheelStyle,
          selectedIndexColor: AppColors.darkBlueLv1,
          onIndexChanged: (index) {
            selectedTime = TimeOfDay(
              hour: index + (selectedPeriod == DayPeriod.pm ? 12 : 0),
              minute: selectedTime.minute,
            );

            setState(() {});

            widget.onChangeWheel(selectedTime);
          },
        ),
        const SizedBox(width: AppSizes.padding),
        WheelPicker(
          builder: itemBuilder,
          controller: minutesWheel,
          style: wheelStyle,
          enableTap: true,
          selectedIndexColor: AppColors.darkBlueLv1,
          onIndexChanged: (index) {
            selectedTime = TimeOfDay(
              hour: selectedTime.hour,
              minute: index,
            );

            setState(() {});

            widget.onChangeWheel(selectedTime);
          },
        ),
        const SizedBox(width: AppSizes.padding),
        WheelPicker(
          itemCount: 2,
          initialIndex: (selectedTime.period == DayPeriod.am) ? 0 : 1,
          looping: false,
          style: wheelStyle,
          builder: (context, index) {
            return Text(
              ([DayPeriod.am, DayPeriod.pm][index]).name.toUpperCase(),
              style: AppTextStyle.bodyLarge(
                fontWeight: AppFontWeight.semibold,
                color: AppColors.darkBlueLv1,
              ),
            );
          },
          onIndexChanged: (index) {
            selectedPeriod = [DayPeriod.am, DayPeriod.pm][index];

            if (selectedPeriod == DayPeriod.pm) {
              selectedTime = TimeOfDay(
                hour: selectedTime.hour < 12 ? selectedTime.hour + 12 : selectedTime.hour,
                minute: selectedTime.minute,
              );
            } else {
              selectedTime = TimeOfDay(
                hour: selectedTime.hour > 11 ? selectedTime.hour - 12 : selectedTime.hour,
                minute: selectedTime.minute,
              );
            }

            setState(() {});

            widget.onChangeWheel(selectedTime);
          },
        ),
      ],
    );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Text(
      "$index".padLeft(2, '0'),
      style: AppTextStyle.bodyLarge(
        fontWeight: AppFontWeight.semibold,
        color: AppColors.darkBlueLv1,
        height: 2,
      ),
    );
  }
}
