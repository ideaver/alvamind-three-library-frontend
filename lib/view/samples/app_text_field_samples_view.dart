import 'package:flutter/material.dart';

import '../../app/const/countries.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/utility/console_log.dart';
import '../../widget/molecule/app_text_field.dart';
import '___sample_wrapper.dart';

class AppTextFieldSamplesView extends StatefulWidget {
  const AppTextFieldSamplesView({super.key});

  static const routeName = '/molecule-app-text-field';

  @override
  State<AppTextFieldSamplesView> createState() => _AppTextFieldSamplesViewState();
}

class _AppTextFieldSamplesViewState extends State<AppTextFieldSamplesView> {
  bool isOtpFieldHasError = true;
  String otpCodeValue = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text Field Samples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            defaultTextField(),
            defaultTextFieldDisabled(),
            defaultTextFieldLong(),
            defaultTextFieldWithLabel(),
            defaultTextFieldWithLabelAndInfoText(),
            defaultTextFieldWithCustomInfoText(),
            defaultTextFieldWithIcon(),
            defaultPasswordField(),
            defaultPasswordFieldWithStrengthMeter(),
            defaultPhoneField(),
            defaultPhoneFieldCompact(),
            defaultOtpField(),
            defaultOtpFieldWithError(),
            defaultNumberTextField(),
            defaultCurrencyTextField(),
            defaultSearchField(),
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

  Widget defaultTextFieldWithLabelAndInfoText() {
    return const SampleWrapper(
      title: 'Default Text Field With Label & Info Text',
      widget: AppTextField(
        labelText: 'Text Field Label',
        hintText: 'Hint text...',
        infoText: 'Info Text',
      ),
    );
  }

  Widget defaultTextFieldWithCustomInfoText() {
    return const SampleWrapper(
      title: 'Default Text Field With Custom Info Text',
      widget: AppTextField(
        hintText: 'Hint text...',
        infoText: 'Info Text',
        infoIcon: Icons.warning,
        infoColor: AppColors.yellowLv1,
      ),
    );
  }

  Widget defaultTextFieldWithIcon() {
    return const SampleWrapper(
      title: 'Default Text Field With Icon',
      widget: AppTextField(
        hintText: 'Hint text...',
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.info_outline_rounded,
      ),
    );
  }

  Widget defaultPasswordField() {
    return const SampleWrapper(
      title: 'Default Password Text Field ',
      widget: AppTextField(
        hintText: 'Hint text...',
        prefixIcon: Icons.lock,
        type: AppTextFieldType.password,
      ),
    );
  }

  Widget defaultPasswordFieldWithStrengthMeter() {
    return const SampleWrapper(
      title: 'Default Password Field With Strength Meter',
      widget: AppTextField(
        hintText: 'Hint text...',
        prefixIcon: Icons.lock,
        type: AppTextFieldType.password,
        showPasswordStrengthMeter: true,
      ),
    );
  }

  Widget defaultPhoneField() {
    return SampleWrapper(
      title: 'Default Phone Field ',
      widget: AppTextField(
        labelText: 'Phone Number',
        hintText: 'Input phone number',
        type: AppTextFieldType.phone,
        selectedCountry: countries.first,
        onTapCountry: (country) {
          cl(country.phoneCode);
        },
      ),
    );
  }

  Widget defaultPhoneFieldCompact() {
    return SampleWrapper(
      title: 'Default Phone Field Compact',
      widget: AppTextField(
        hintText: 'Input phone number',
        type: AppTextFieldType.phoneCompact,
        selectedCountry: countries.first,
        // Remove this if the widget called from another project
        isFromAppAssets: false,
        onTapCountry: (country) {
          cl(country.phoneCode);
        },
      ),
    );
  }

  Widget defaultOtpField() {
    return const SampleWrapper(
      title: 'Default OTP Field',
      widget: AppTextField(
        type: AppTextFieldType.otp,
        labelText: 'Kode Verifikasi',
        hintText: '0',
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget defaultOtpFieldWithError() {
    return SampleWrapper(
      title: 'Default OTP Field With Error',
      widget: AppTextField(
        otpCodeValue: otpCodeValue,
        type: AppTextFieldType.otp,
        labelText: 'Kode Verifikasi',
        hintText: '0',
        textAlign: TextAlign.center,
        isHasError: isOtpFieldHasError,
        infoText: 'Info Text',
        onChanged: (val) {
          cl(val);
          otpCodeValue = val;

          if (val.isEmpty) {
            isOtpFieldHasError = false;
          } else {
            isOtpFieldHasError = true;
          }

          setState(() {});
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

  Widget defaultCurrencyTextField() {
    return const SampleWrapper(
      title: 'Default Currency Text Field ',
      widget: AppTextField(
        hintText: 'Input number',
        type: AppTextFieldType.currency,
      ),
    );
  }

  Widget defaultSearchField() {
    return const SampleWrapper(
      title: 'Default Search Field ',
      widget: AppTextField(
        hintText: 'Input search',
        type: AppTextFieldType.search,
        rounded: false,
        borderRadius: AppSizes.padding,
      ),
    );
  }

  Widget customTextField() {
    return SampleWrapper(
      title: 'Custom Text Field ',
      widget: AppTextField(
        labelText: 'This Is A Label',
        hintText: 'Hint text...',
        infoText: 'Info Text',
        infoIcon: Icons.warning,
        infoColor: AppColors.yellowLv1,
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.check_circle_rounded,
        fillColor: AppColors.redLv6,
        iconsColor: AppColors.redLv1,
        onFocusFillColor: AppColors.greenLv6,
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
        hintStyle: AppTextStyle.semiBold(
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
        infoText: 'Info Text',
        infoIcon: Icons.warning,
        infoColor: AppColors.black,
        onFocusInfoColor: AppColors.black,
        prefixIcon: Icons.person_2_rounded,
        suffixIcon: Icons.check_circle_rounded,
        fillColor: AppColors.blackLv1,
        iconsColor: AppColors.white,
        onFocusFillColor: AppColors.blackLv1,
        onFocusIconsColor: AppColors.white,
        borderColor: AppColors.black,
        onFocusBorderColor: AppColors.redLv1,
        borderWidth: 3,
        rounded: false,
        borderRadius: 8,
        labelStyle: AppTextStyle.bold(
          size: 12,
          color: AppColors.blackLv1,
        ),
        textStyle: AppTextStyle.bold(
          size: 14,
          color: AppColors.white,
        ),
        hintStyle: AppTextStyle.semiBold(
          size: 14,
          color: AppColors.blackLv6,
        ),
      ),
    );
  }
}
