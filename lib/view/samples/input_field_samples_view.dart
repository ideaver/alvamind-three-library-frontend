import 'package:flutter/material.dart';

import '../../app/const/countries.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/utility/console_log.dart';
import '../../widget/molecule/app_text_field.dart';
import 'sample_wrapper.dart';

class InputFieldSamplesView extends StatefulWidget {
  const InputFieldSamplesView({Key? key}) : super(key: key);

  static const routeName = '/molecule-input-field-samples';

  @override
  State<InputFieldSamplesView> createState() => _InputFieldSamplesViewState();
}

class _InputFieldSamplesViewState extends State<InputFieldSamplesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Field Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTextField(),
            defaultTextFieldDisabled(),
            defaultTextFieldLong(),
            defaultTextFieldWithLabel(),
            defaultTextFieldWithIcon(),
            defaultPasswordTextField(),
            defaultPhoneTextField(),
            defaultNumberTextField(),
            customTextField(),
            customTextFieldDark(),
          ],
        ),
      ),
    );
  }

  Widget defaultTextField() {
    return const SampleWrapper(
      title: 'Default Text Field',
      widget: AppTextField(
        hintText: 'Hint text...',
      ),
    );
  }

  Widget defaultTextFieldDisabled() {
    return const SampleWrapper(
      title: 'Default Text Field Disabled',
      widget: AppTextField(
        hintText: 'Hint text...',
        enabled: false,
      ),
    );
  }

  Widget defaultTextFieldLong() {
    return const SampleWrapper(
      title: 'Default Text Field Long',
      widget: AppTextField(
        hintText: 'Hint text...',
        minLines: 5,
      ),
    );
  }

  Widget defaultTextFieldWithLabel() {
    return const SampleWrapper(
      title: 'Default Text Field With Label',
      widget: AppTextField(
        labelText: 'Text Field Label',
        hintText: 'Hint text...',
      ),
    );
  }

  Widget defaultTextFieldWithIcon() {
    return const SampleWrapper(
      title: 'Default Text Field With Icon',
      widget: AppTextField(
        hintText: 'Hint text...',
        prefixIcon: Icons.person_2_rounded,
      ),
    );
  }

  Widget defaultPasswordTextField() {
    return const SampleWrapper(
      title: 'Default Password Text Field ',
      widget: AppTextField(
        hintText: 'Hint text...',
        prefixIcon: Icons.lock,
        type: AppTextFieldType.password,
      ),
    );
  }

  Widget defaultPhoneTextField() {
    return SampleWrapper(
      title: 'Default Phone Text Field ',
      widget: AppTextField(
        hintText: 'Input phone number',
        prefixIcon: Icons.lock,
        type: AppTextFieldType.phone,
        selectedCountry: countries.first,
        onTapCountry: (country) {
          cl(country.phoneCode);
        },
      ),
    );
  }

  Widget defaultNumberTextField() {
    return const SampleWrapper(
      title: 'Default Number Text Field ',
      widget: AppTextField(
        hintText: 'Input number',
        type: AppTextFieldType.number,
      ),
    );
  }

  Widget customTextField() {
    return SampleWrapper(
      title: 'Custom Text Field ',
      widget: AppTextField(
        labelText: 'This Is A Label',
        hintText: 'Hint text...',
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.check_circle_rounded,
        fillColor: AppColors.redLv7,
        iconsColor: AppColors.redLv1,
        onFocusFillColor: AppColors.greenLv7,
        onFocusIconsColor: AppColors.greenLv1,
        borderColor: AppColors.greenLv1,
        borderRadius: 8,
        labelStyle: AppTextStyle.bold(
          size: 12,
          color: AppColors.redLv1,
        ),
        textStyle: AppTextStyle.bold(
          size: 14,
          color: AppColors.blackLv2,
        ),
        hintStyle: AppTextStyle.semibold(
          size: 14,
          color: AppColors.blackLv4,
        ),
      ),
    );
  }

  Widget customTextFieldDark() {
    return SampleWrapper(
      title: 'Custom Text Field Dark ',
      widget: AppTextField(
        labelText: 'This Is A Label',
        hintText: 'Hint text...',
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.check_circle_rounded,
        fillColor: AppColors.blackLv1,
        iconsColor: AppColors.white,
        onFocusFillColor: AppColors.blackLv1,
        onFocusIconsColor: AppColors.white,
        borderColor: AppColors.black,
        borderRadius: 8,
        labelStyle: AppTextStyle.bold(
          size: 12,
          color: AppColors.blackLv1,
        ),
        textStyle: AppTextStyle.bold(
          size: 14,
          color: AppColors.white,
        ),
        hintStyle: AppTextStyle.semibold(
          size: 14,
          color: AppColors.blackLv6,
        ),
      ),
    );
  }
}
