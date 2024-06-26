import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app/asset/app_assets.dart';
import '../../app/const/countries.dart';
import '../../app/locale/app_locale.dart';
import '../../app/theme/app_colors.dart';
import '../../app/theme/app_sizes.dart';
import '../../app/theme/app_text_style.dart';
import '../../app/utility/console_log.dart';
import '../../app/utility/validator.dart';
import '../../model/country_model.dart';
import '../../model/drop_down_model.dart';
import '../atom/app_image.dart';
import '../atom/app_tool_tip.dart';
import 'app_drop_down.dart';
import 'app_icon_button.dart';

// AppTextField
// v.3.0.1
// by Elriz Wiraswara

enum AppTextFieldType {
  text,
  password,
  number,
  phone,
  phoneCompact,
  otp,
  search,
  currency,
}

class AppTextField extends StatefulWidget {
  final AppTextFieldType type;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool enabled;
  final bool autofocus;
  final bool showSearchFilter;
  final bool rounded;
  final bool isHasError;
  final bool showInfoIcon;
  final bool showPasswordStrengthMeter;
  final double fontSize;
  final double? iconsSize;
  final double borderRadius;
  final double infoIconSize;
  final double borderWidth;
  final EdgeInsets contentPadding;
  final Color labelTextColor;
  final Color onFocusLabelTextColor;
  final Color infoColor;
  final Color onFocusInfoColor;
  final Color fillColor;
  final Color onFocusFillColor;
  final Color iconsColor;
  final Color onFocusIconsColor;
  final Color borderColor;
  final Color onFocusBorderColor;
  final Color disabledColor;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final int otpDigitLength;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? infoStyle;
  final TextAlign? textAlign;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final String? infoText;
  final String? otpCodeValue;
  // [DEPRECATED] USE INFO TEXT INSTEAD
  // final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final IconData? infoIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  // [DEPRECATED] NOT ALWAYS SHOWING UP
  // final String? prefixText;
  // final String? suffixText;
  // final TextStyle? prefixStyle;
  // final TextStyle? suffixStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool showCounter;
  final CountryModel? selectedCountry;
  final bool isFromAppAssets;
  final String appAssetsPackageName;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function(String)? onSubmitted;
  final Function()? onTapSearcFilter;
  final Function(CountryModel)? onTapCountry;

  const AppTextField({
    super.key,
    this.type = AppTextFieldType.text,
    this.controller,
    this.focusNode,
    this.enabled = true,
    this.autofocus = false,
    this.showSearchFilter = true,
    this.rounded = true,
    this.isHasError = false,
    this.showInfoIcon = true,
    this.showPasswordStrengthMeter = false,
    this.fontSize = 14,
    this.iconsSize,
    this.borderRadius = 6,
    this.infoIconSize = 12,
    this.borderWidth = 1,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    this.labelTextColor = AppColors.secondary,
    this.onFocusLabelTextColor = AppColors.primary,
    this.infoColor = AppColors.blackLv1,
    this.onFocusInfoColor = AppColors.primary,
    this.fillColor = AppColors.white,
    this.onFocusFillColor = AppColors.white,
    this.iconsColor = AppColors.blackLv5,
    this.onFocusIconsColor = AppColors.primary,
    this.borderColor = AppColors.blackLv7,
    this.onFocusBorderColor = AppColors.primary,
    this.disabledColor = AppColors.blackLv9,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.otpDigitLength = 4,
    this.labelStyle,
    this.textStyle,
    this.hintStyle,
    this.infoStyle,
    this.textAlign,
    this.textInputType,
    this.textInputAction,
    this.hintText,
    this.labelText,
    this.infoText,
    this.otpCodeValue,
    // this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.infoIcon = Icons.info_outline_rounded,
    this.prefixWidget,
    this.suffixWidget,
    // this.prefixWidget,
    // this.suffixWidget,
    // this.prefixText,
    // this.suffixText,
    // this.prefixStyle,
    // this.suffixStyle,
    // If want to load asset from origin app or other
    // set [isFromAppAssets] to false or set [appAssetsPackageName] to destination package name
    this.isFromAppAssets = true,
    this.appAssetsPackageName = AppAssets.appAssetsPackageName,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTapSearcFilter,
    this.onTapCountry,
    this.inputFormatters,
    this.showCounter = false,
    this.selectedCountry,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  // OTP Field
  List<TextEditingController> _controllerList = [];
  List<FocusNode> _focusNodeList = [];
  String otpCodeValue = '';

  // Styles
  Color _fillColor = AppColors.white;
  Color _labelTextColor = AppColors.blackLv7;
  Color _infoColor = AppColors.blackLv7;
  Color _iconsColor = AppColors.blackLv5;
  Color _borderColor = AppColors.blackLv7;

  // Password
  bool _obsecureText = false;

  // Phone country code
  CountryModel _country = countries.first;

  // Password strength validator
  int passwordStrengthValue = 0;

  void passwordValidator() {
    bool isLengthMoreThan4 = _controller.text.length > 4;
    bool isContainsUppercase = Validator.isContainsUppercase(_controller.text);
    bool isContainsNumber = Validator.isContainsNumber(_controller.text);
    bool isLengthMoreThan8 = _controller.text.length > 8;

    if (isLengthMoreThan4 && isContainsUppercase && isContainsNumber && isLengthMoreThan8) {
      passwordStrengthValue = 3;
    } else if (isLengthMoreThan4 && isContainsUppercase && isContainsNumber) {
      passwordStrengthValue = 2;
    } else if (isLengthMoreThan4 && (isContainsUppercase || isContainsNumber || isLengthMoreThan8)) {
      passwordStrengthValue = 1;
    } else {
      passwordStrengthValue = 0;
    }
  }

  Color passwordStrengthLineColor(int i) {
    if (passwordStrengthValue >= i) {
      return passwordStrengthColor();
    }

    return AppColors.blackLv7;
  }

  Color passwordStrengthColor() {
    if (passwordStrengthValue == 0) {
      return AppColors.error;
    }
    if (passwordStrengthValue == 1) {
      return AppColors.yellowLv1;
    }
    if (passwordStrengthValue == 2) {
      return AppColors.greenLv1;
    }
    if (passwordStrengthValue == 3) {
      return AppColors.primary;
    }

    return AppColors.blackLv7;
  }

  String passwordStrengthLabel() {
    if (passwordStrengthValue == 0) {
      return 'Lemah';
    }
    if (passwordStrengthValue == 1) {
      return 'Sedang';
    }
    if (passwordStrengthValue == 2) {
      return 'Kuat';
    }
    if (passwordStrengthValue == 3) {
      return 'Sangat Kuat';
    }

    return 'Lemah';
  }

  @override
  void initState() {
    if (widget.type == AppTextFieldType.otp) {
      _controllerList = [
        ...List.generate(widget.otpDigitLength, (index) => TextEditingController()),
      ];
      _focusNodeList = [
        ...List.generate(widget.otpDigitLength, (index) => FocusNode()),
      ];

      if (widget.otpCodeValue != null) {
        otpCodeValue = widget.otpCodeValue!;

        for (int i = 0; i < _controllerList.length; i++) {
          _controllerList[i].text = widget.otpCodeValue!.split('')[i];
        }
      }
    }

    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();

    _obsecureText = widget.type == AppTextFieldType.password;

    _country = widget.selectedCountry ?? countries.first;

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _fillColor = widget.onFocusFillColor;
          _labelTextColor = widget.onFocusLabelTextColor;
          _infoColor = widget.onFocusInfoColor;
          _iconsColor = widget.onFocusIconsColor;
        });
      } else {
        setState(() {
          _fillColor = widget.fillColor;
          _labelTextColor = widget.labelTextColor;
          _infoColor = widget.infoColor;
          _iconsColor = widget.iconsColor;
          _borderColor = widget.borderColor;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isHasError) {
      _fillColor = widget.fillColor;
      _labelTextColor = widget.labelTextColor;
      _infoColor = widget.infoColor;
      _iconsColor = widget.iconsColor;
      _borderColor = widget.borderColor;
    } else {
      _labelTextColor = AppColors.error;
      _infoColor = AppColors.error;
      _iconsColor = AppColors.error;
      _borderColor = AppColors.error;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget(),
        textFieldWidget(),
        passwordStrengthMeter(),
        infoWidget(),
      ],
    );
  }

  Widget phoneField() {
    return Row(
      children: [
        Expanded(child: phoneCodeDropDown()),
        const SizedBox(width: AppSizes.padding / 2),
        Expanded(flex: 2, child: textField()),
      ],
    );
  }

  Widget labelWidget() {
    if (widget.labelText == null || widget.labelText == '') {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      margin: widget.type == AppTextFieldType.otp
          ? const EdgeInsets.symmetric(horizontal: AppSizes.padding / 4)
          : EdgeInsets.zero,
      child: Text(
        widget.labelText!,
        style: widget.labelStyle ??
            AppTextStyle.bodyMedium(
              fontWeight: AppFontWeight.medium,
              color: _labelTextColor,
            ),
      ),
    );
  }

  Widget passwordStrengthMeter() {
    if (widget.type != AppTextFieldType.password) {
      return const SizedBox.shrink();
    }

    if (!widget.showPasswordStrengthMeter) {
      return const SizedBox.shrink();
    }

    if (_controller.text.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          ...List.generate(4, (i) {
            return Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 4,
                margin: const EdgeInsets.only(right: AppSizes.padding / 4),
                decoration: BoxDecoration(
                  color: passwordStrengthLineColor(i),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            );
          }),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(right: AppSizes.padding / 2),
              child: Text(
                passwordStrengthLabel(),
                textAlign: TextAlign.right,
                style: AppTextStyle.bold(
                  size: 12,
                  color: passwordStrengthColor(),
                  height: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget infoWidget() {
    if (widget.infoText == null || widget.infoText == '') {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showInfoIcon
              ? Padding(
                  padding: const EdgeInsets.only(right: 6.0, top: 2.0),
                  child: Icon(
                    widget.infoIcon,
                    color: _infoColor,
                    size: widget.infoIconSize,
                  ),
                )
              : const SizedBox.shrink(),
          Flexible(
            child: Text(
              widget.infoText!,
              style: widget.infoStyle ??
                  AppTextStyle.bodyXSmall(
                    fontWeight: AppFontWeight.regular,
                    color: _infoColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget textFieldWidget() {
    if (widget.type == AppTextFieldType.phone) {
      return phoneField();
    }

    if (widget.type == AppTextFieldType.otp) {
      return otpField();
    }

    return textField();
  }

  FocusNode textFieldFocusNode(int i) {
    if (widget.type == AppTextFieldType.otp) {
      return _focusNodeList[i];
    }

    return _focusNode;
  }

  int? textFieldMaxLines() {
    if (widget.type == AppTextFieldType.password ||
        widget.type == AppTextFieldType.search ||
        widget.type == AppTextFieldType.otp) {
      return 1;
    }

    if (widget.rounded && (widget.minLines ?? 0) <= 1) {
      return 1;
    }

    return widget.maxLines;
  }

  int? textFieldMaxLength() {
    if (widget.type == AppTextFieldType.otp) {
      return 1;
    }

    return widget.maxLength;
  }

  TextEditingController textFieldController(int i) {
    if (widget.type == AppTextFieldType.otp) {
      return _controllerList[i];
    }

    return _controller;
  }

  TextStyle textFieldTextStyle() {
    if (widget.textStyle != null) {
      return widget.textStyle!.copyWith(
        color: widget.isHasError ? AppColors.error : null,
      );
    }

    return AppTextStyle.bodyMedium(
      fontWeight: AppFontWeight.semibold,
      color: widget.isHasError ? AppColors.error : null,
    );
  }

  Widget textField({int textFieldIndex = 0}) {
    return GestureDetector(
      onTap: widget.onTap,
      child: TextField(
        focusNode: textFieldFocusNode(textFieldIndex),
        controller: textFieldController(textFieldIndex),
        onChanged: (value) => onChanged(value, textFieldIndex: textFieldIndex),
        onEditingComplete: widget.onEditingComplete,
        onSubmitted: widget.onSubmitted,
        enabled: widget.enabled,
        style: textFieldTextStyle(),
        cursorColor: AppColors.blackLv1,
        cursorWidth: 1.5,
        autofocus: widget.autofocus,
        obscureText: _obsecureText,
        minLines: widget.minLines,
        maxLines: textFieldMaxLines(),
        maxLength: textFieldMaxLength(),
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        keyboardType: keyboardType(),
        textInputAction: widget.textInputAction,
        inputFormatters: inputFormatters(),
        textAlign: widget.textAlign ?? TextAlign.left,
        decoration: InputDecoration(
          // [DEPRECATED] USE INFO TEXT INSTEAD
          // errorText: widget.errorText,
          counterText: widget.showCounter ? null : '',
          isDense: true,
          filled: true,
          fillColor: widget.enabled ? _fillColor : widget.disabledColor,
          prefixIcon: widget.prefixWidget ?? prefixIconWidget(),
          suffixIcon: widget.suffixWidget ?? suffixIconWidget(),
          // [DEPRECATED] NOT ALWAYS SHOWING UP USE PREFIX ICON INSTEAD
          // prefix: widget.prefixWidget,
          // suffix: widget.suffixWidget,
          // prefixText: widget.prefixText,
          // suffixText: widget.suffixText,
          // prefixStyle: widget.prefixStyle,
          // suffixStyle: widget.suffixStyle,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle ??
              AppTextStyle.bodyMedium(
                fontWeight: AppFontWeight.regular,
                color: widget.isHasError ? AppColors.redLv5 : AppColors.blackLv5,
              ),
          contentPadding: widget.contentPadding,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.rounded && (widget.minLines ?? 0) <= 1 ? 100 : widget.borderRadius),
            ),
            borderSide: BorderSide(
              width: widget.borderWidth,
              color: widget.onFocusBorderColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.rounded && (widget.minLines ?? 0) <= 1 ? 100 : widget.borderRadius),
            ),
            borderSide: BorderSide(
              width: widget.borderWidth,
              color: AppColors.error,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.rounded && (widget.minLines ?? 0) <= 1 ? 100 : widget.borderRadius),
            ),
            borderSide: BorderSide(
              width: widget.borderWidth,
              color: AppColors.error,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.rounded && (widget.minLines ?? 0) <= 1 ? 100 : widget.borderRadius),
            ),
            borderSide: BorderSide(
              width: widget.borderWidth,
              color: _borderColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(widget.rounded && (widget.minLines ?? 0) <= 1 ? 100 : widget.borderRadius),
            ),
            borderSide: BorderSide(
              width: widget.borderWidth,
              color: _borderColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget otpField() {
    return Row(
      children: [
        ...List.generate(
          widget.otpDigitLength,
          (i) => Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding / 4),
              child: textField(
                textFieldIndex: i,
              ),
            ),
          ),
        )
      ],
    );
  }

  void onChanged(String value, {int textFieldIndex = 0}) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }

    if (widget.type == AppTextFieldType.password) {
      passwordValidator();
    }

    if (widget.type == AppTextFieldType.otp) {
      otpOnChanged(textFieldIndex);
    }

    setState(() {});
  }

  void otpOnChanged(int textFieldIndex) {
    if (_controllerList[textFieldIndex].text.isNotEmpty) {
      otpCodeValue += _controllerList[textFieldIndex].text;

      if (textFieldIndex == widget.otpDigitLength - 1) {
        FocusScope.of(context).unfocus();
      } else {
        FocusScope.of(context).requestFocus(_focusNodeList[textFieldIndex + 1]);
      }
    } else {
      otpCodeValue = otpCodeValue.substring(0, textFieldIndex);

      if (textFieldIndex == 0) {
        FocusScope.of(context).requestFocus(_focusNodeList[0]);
      } else {
        FocusScope.of(context).requestFocus(_focusNodeList[textFieldIndex - 1]);
      }
    }

    // Setting otp code value to text field
    _controller.text = otpCodeValue;

    // Returning otp code value
    widget.onChanged!(otpCodeValue);
  }

  TextInputType? keyboardType() {
    if (widget.textInputType != null) {
      return widget.textInputType;
    }

    if (widget.type == AppTextFieldType.phone || widget.type == AppTextFieldType.phoneCompact) {
      return TextInputType.phone;
    }

    if (widget.type == AppTextFieldType.number ||
        widget.type == AppTextFieldType.currency ||
        widget.type == AppTextFieldType.otp) {
      return TextInputType.number;
    }

    return widget.textInputType;
  }

  List<TextInputFormatter>? inputFormatters() {
    if (widget.inputFormatters != null) {
      return widget.inputFormatters;
    }

    if (widget.type == AppTextFieldType.phone || widget.type == AppTextFieldType.phoneCompact) {
      return [FilteringTextInputFormatter.digitsOnly];
    }

    if (widget.type == AppTextFieldType.number) {
      return [FilteringTextInputFormatter.digitsOnly];
    }

    return widget.inputFormatters;
  }

  Widget? prefixIconWidget() {
    if (widget.type == AppTextFieldType.phoneCompact) {
      return phoneCodePopupButton();
    }

    if (widget.type == AppTextFieldType.currency) {
      return Padding(
        padding: EdgeInsets.fromLTRB(
          widget.contentPadding.left,
          widget.contentPadding.top,
          widget.contentPadding.right / 2,
          widget.contentPadding.bottom,
        ),
        child: Text(
          AppLocale.defaultCurrencyCode,
          style: AppTextStyle.bold(
            size: widget.iconsSize ?? 14,
            color: _iconsColor,
          ),
        ),
      );
    }

    if (widget.prefixIcon == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(
        widget.prefixIcon,
        color: _iconsColor,
        size: widget.iconsSize,
      ),
    );
  }

  Widget? suffixIconWidget() {
    if (widget.type == AppTextFieldType.password) {
      return textVisibilityIconButton();
    }

    if (widget.type == AppTextFieldType.search) {
      if (_controller.text.isEmpty) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            widget.suffixIcon ?? Icons.search_rounded,
            color: _iconsColor,
            size: widget.iconsSize,
          ),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.fromLTRB(4, 8, 12, 8),
          child: AppIconButton(
            icon: Icon(
              Icons.close,
              color: AppColors.darkBlueLv2,
              size: widget.iconsSize,
            ),
            buttonColor: AppColors.blackLv8,
            padding: EdgeInsets.zero,
            onTap: () {
              _controller.clear();
              if (widget.onChanged != null) {
                widget.onChanged!('');
              }
              setState(() {});
            },
          ),
        );
      }
    }

    if (widget.type == AppTextFieldType.search) {
      if (!widget.showSearchFilter) {
        return null;
      }

      return GestureDetector(
        onTap: widget.onTapSearcFilter,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            widget.suffixIcon ?? Icons.tune_rounded,
            color: _iconsColor,
            size: widget.iconsSize,
          ),
        ),
      );
    }

    if (widget.suffixIcon == null) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Icon(
        widget.suffixIcon,
        color: _iconsColor,
        size: widget.iconsSize,
      ),
    );
  }

  Widget textVisibilityIconButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obsecureText = !_obsecureText;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          _obsecureText ? Icons.visibility_off_rounded : Icons.remove_red_eye_rounded,
          color: _iconsColor,
          size: widget.iconsSize,
        ),
      ),
    );
  }

  Widget phoneCodePopupButton() {
    return AppToolTipMenu(
      onTapItem: (i) {
        if (widget.onTapCountry != null) {
          widget.onTapCountry!(countries[i]);
        }

        _country = countries[i];
        setState(() {});
      },
      padding: const EdgeInsets.only(left: 24, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widget.iconsSize ?? 24,
            child: AppImage(
              image: _country.flag,
              imgProvider: ImgProvider.assetImage,
              isFromAppAssets: widget.isFromAppAssets,
              appAssetsPackageName: widget.appAssetsPackageName,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: _iconsColor,
            size: widget.iconsSize ?? 24,
          ),
          const SizedBox(width: 4),
          Text(
            _country.phoneCode,
            style: widget.textStyle ?? AppTextStyle.bodyMedium(fontWeight: AppFontWeight.semibold),
          )
        ],
      ),
      children: List.generate(countries.length, (i) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: widget.iconsSize ?? 24,
              child: AppImage(
                image: countries[i].flag,
                imgProvider: ImgProvider.assetImage,
                isFromAppAssets: widget.isFromAppAssets,
                appAssetsPackageName: widget.appAssetsPackageName,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              countries[i].phoneCode,
              style: AppTextStyle.semiBold(size: 12),
            )
          ],
        );
      }),
    );
  }

  Widget phoneCodeDropDown() {
    return AppDropDown(
      suffixIcon: Icons.keyboard_arrow_down_rounded,
      iconsSize: 26,
      selectedItem: _country.phoneCode,
      enabled: widget.enabled,
      items: [
        ...List.generate(
          countries.length,
          (i) => DropDownModel(
            text: countries[i].phoneCode,
            value: countries[i].phoneCode,
          ),
        )
      ],
      itemsBuilder: (value) {
        return Text(
          value.value,
          style: AppTextStyle.semiBold(size: 12),
        );
      },
      onTapItem: (value) {
        var item = countries.where((e) => e.phoneCode == value.value).firstOrNull;

        if (item == null) {
          cl('item null');
          return;
        }

        if (widget.onTapCountry != null) {
          widget.onTapCountry!(item);
        }

        _country = item;
        setState(() {});
      },
    );
  }
}
