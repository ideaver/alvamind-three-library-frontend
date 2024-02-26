/* import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class AppTimePicker extends StatefulWidget {
  const AppTimePicker({super.key});

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  final now = TimeOfDay.now();
  late final hoursWheel = WheelPickerController(
    itemCount: 12,
    initialIndex: now.hour % 12,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [hoursWheel],
  );

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 26.0, height: 1.5);
    final wheelStyle = WheelPickerStyle(
      size: 200,
      itemExtent: textStyle.fontSize! * textStyle.height!, // Text height
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text("$index".padLeft(2, '0'), style: textStyle);
    }

    return SizedBox(
      width: 200.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _centerBar(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  WheelPicker(
                    builder: itemBuilder,
                    controller: hoursWheel,
                    looping: false,
                    style: wheelStyle,
                    selectedIndexColor: Colors.redAccent,
                  ),
                  const Text(":", style: textStyle),
                  WheelPicker(
                    builder: itemBuilder,
                    controller: minutesWheel,
                    style: wheelStyle,
                    enableTap: true,
                    selectedIndexColor: Colors.redAccent,
                  )
                ],
              ),
              WheelPicker(
                itemCount: 2,
                builder: (context, index) {
                  return Text(["AM", "PM"][index], style: textStyle);
                },
                initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
                looping: false,
                style: wheelStyle.copyWith(
                    shiftAnimationStyle: const WheelShiftAnimationStyle(
                  duration: Duration(seconds: 1),
                  curve: Curves.bounceOut,
                )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    super.dispose();
  }

  Widget _centerBar(BuildContext context) {
    return Center(
      child: Container(
        height: 38.0,
        decoration: BoxDecoration(
          color: const Color(0xFFC3C9FA).withAlpha(26),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
} */

import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:wheel_picker/wheel_picker.dart';

class AppTimePicker extends StatefulWidget {
  const AppTimePicker({super.key});

  @override
  State<AppTimePicker> createState() => _AppTimePickerState();
}

class _AppTimePickerState extends State<AppTimePicker> {
  late TimeOfDay selectedTime;
  final now = TimeOfDay.now();
  late var selecPeriod = 'AM';

  late final hoursWheel = WheelPickerController(
    itemCount: 12,
    initialIndex: now.hour % 12,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: now.minute,
    mounts: [hoursWheel],
  );

  @override
  void initState() {
    super.initState();
    selectedTime = TimeOfDay.now();
    selectedTime = TimeOfDay(
      hour: hoursWheel.selected % 12,
      minute: minutesWheel.selected,
    );
  }

  @override
  Widget build(BuildContext context) {
    const wheelStyle = WheelPickerStyle(
      size: 200,
      squeeze: 1.25,
      diameterRatio: .8,
      surroundingOpacity: .25,
      magnification: 1.2,
    );

    Widget itemBuilder(BuildContext context, int index) {
      return Text(
        "$index".padLeft(2),
        style: AppTextStyle.bodyLarge(
          fontWeight: AppFontWeight.semibold,
          color: AppColors.darkBlueLv1,
        ),
      );
    }

    return Container(
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //Text('${selectedTime.format(context)}$selecPeriod'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  WheelPicker(
                    builder: itemBuilder,
                    controller: hoursWheel,
                    looping: false,
                    style: wheelStyle,
                    onIndexChanged: (index) {
                      //print('$index');
                      setState(() {
                        selectedTime = TimeOfDay(
                          hour: index % 12,
                          minute: selectedTime.minute,
                        );
                      });
                    },
                    selectedIndexColor: AppColors.darkBlueLv1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  WheelPicker(
                    builder: itemBuilder,
                    controller: minutesWheel,
                    style: wheelStyle,
                    enableTap: true,
                    onIndexChanged: (index) {
                      //print('$index');
                      setState(() {
                        selectedTime = TimeOfDay(
                          hour: selectedTime.hour,
                          minute: index,
                        );
                      });
                    },
                    selectedIndexColor: AppColors.darkBlueLv1,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  WheelPicker(
                    itemCount: 2,
                    builder: (context, index) {
                      return Text(
                        (["AM", "PM"][index]),
                        style: AppTextStyle.bodyLarge(
                          fontWeight: AppFontWeight.semibold,
                          color: AppColors.darkBlueLv1,
                        ),
                      );
                    },
                    onIndexChanged: (index) {
                      //print('$index');
                      setState(() {
                        selecPeriod = ["AM", "PM"][index];
                      });
                    },
                    initialIndex: (now.period == DayPeriod.am) ? 0 : 1,
                    looping: false,
                    style: wheelStyle.copyWith(
                      shiftAnimationStyle: const WheelShiftAnimationStyle(
                        duration: Duration(seconds: 1),
                        curve: Curves.bounceOut,
                      ),
                    ),
                  ),
                  //Text('${selectedTime.format(context)}$selectedPeriod'),
                ],
              ),
            ],
          ),
          //Text('${selectedTime.format(context)}$selecPeriod'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    hoursWheel.dispose();
    minutesWheel.dispose();
    super.dispose();
  }
}
