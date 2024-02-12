// import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
// import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
// import 'package:alvamind_three_library_frontend/app/theme/app_text_style.dart';
// import 'package:flutter/material.dart';

// class AppFieldContainer extends StatelessWidget {
//   final Function()? onTap;
//   final Widget? leading;
//   final String? title;
//   final String? subtitle;
//   final Widget? trailing;
//   final TextStyle? titleStyle;
//   final TextStyle? subtitleStyle;
//   final double? height;
//   final double? width;
//   final bool showBorder;
//   final double? borderRadius;
//   final bool radius;
//   final Color? backgroundColor;
//   final EdgeInsets? padding;

//   const AppFieldContainer({
//     super.key,
//     this.onTap,
//     this.leading,
//     this.title,
//     this.subtitle,
//     this.trailing,
//     this.titleStyle,
//     this.subtitleStyle,
//     this.height,
//     this.width,
//     this.showBorder = true,
//     this.borderRadius,
//     this.radius = true,
//     this.backgroundColor,
//     this.padding,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: height ?? 78,
//         width: width ?? MediaQuery.of(context).size.width,
//         decoration: showBorder
//             ? BoxDecoration(
//                 color: backgroundColor ?? Colors.white,
//                 borderRadius:
//                     BorderRadius.circular(radius ? 20 : borderRadius!),
//                 border: Border.all(width: 1, color: AppColors.blackLv7),
//               )
//             : null,
//         child: Padding(
//           padding: padding ??
//               const EdgeInsets.symmetric(horizontal: AppSizes.padding),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               if (leading != null) ...[
//                 leading!,
//                 const SizedBox(
//                   width: AppSizes.padding,
//                 ),
//               ],
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (title != null)
//                     Text(
//                       title!,
//                       style: titleStyle ??
//                           AppTextStyle.bodyMedium(
//                               fontWeight: AppFontWeight.bold,
//                               color: AppColors.secondary),
//                     ),
//                   const SizedBox(
//                     height: 5.0,
//                   ),
//                   if (subtitle != null)
//                     Text(
//                       subtitle!,
//                       style: subtitleStyle ??
//                           AppTextStyle.bodySmall(
//                               fontWeight: AppFontWeight.regular,
//                               color: AppColors.blackLv5),
//                     ),
//                 ],
//               ),
//               const Spacer(),
//               if (trailing != null) trailing!,
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
