// import 'package:flutter/material.dart';

// import '../../app/theme/app_colors.dart';
// import '../../app/theme/app_text_style.dart';

// class AppTabButton extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final double borderRadius;
//   final Color enabledColor;
//   final Color disableColor;
//   final bool rounded;
//   final EdgeInsets? padding;
//   final String text;
//   final bool isSelected;
//   final Function() onTap;

//   const AppTabButton({
//     super.key,
//     this.width,
//     this.height,
//     required this.enabledColor,
//     required this.disableColor,
//     this.borderRadius = 6,
//     this.rounded = true,
//     this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
//     required this.text,
//     required this.isSelected,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         width: width,
//         height: height,
//         padding: padding,
//         decoration: BoxDecoration(
//           color: isSelected ? enabledColor : disableColor,
//           borderRadius: BorderRadius.circular(rounded ? 100 : borderRadius),
//         ),
//         child: Text(
//           textAlign: TextAlign.center,
//           text,
//           style: AppTextStyle.bodySmall(
//             fontWeight: AppFontWeight.semibold,
//             color: isSelected ? AppColors.blackLv8 : AppColors.secondary,
//           ),
//         ),
//       ),
//     );
//   }
// }
