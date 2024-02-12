// import 'package:alvamind_three_library_frontend/app/theme/app_colors.dart';
// import 'package:alvamind_three_library_frontend/app/theme/app_sizes.dart';
// import 'package:flutter/material.dart';

// import 'app_tab_button.dart';

// class AppTabButtonGroup extends StatefulWidget {
//   final Function? onTap;
//   final List<String> options;
//   final List<Widget> pages;
//   final double borderRadius;
//   final bool rounded;
//   final double? width;
//   final double? height;
//   final EdgeInsets padding;

//   const AppTabButtonGroup({
//     super.key,
//     this.onTap,
//     this.borderRadius = 100,
//     this.rounded = true,
//     this.width,
//     this.height,
//     this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//     required this.options,
//     required this.pages,
//   });

//   @override
//   AppTabButtonGroupState createState() => AppTabButtonGroupState();
// }

// class AppTabButtonGroupState extends State<AppTabButtonGroup> {
//   late int selectedOptionIndex;

//   @override
//   void initState() {
//     super.initState();
//     selectedOptionIndex = 0;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     return SizedBox(
//       child: Column(
//         children: [
//           Container(
//             height: widget.height ?? 64,
//             decoration: BoxDecoration(
//               color: AppColors.greyScale50,
//               borderRadius: BorderRadius.circular(
//                 widget.rounded ? 100 : widget.borderRadius,
//               ),
//             ),
//             child: Padding(
//               padding: widget.padding,
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   widget.options.length,
//                   (index) => Expanded(
//                     child: AppTabButton(
//                       disableColor: AppColors.greyScale50,
//                       enabledColor: AppColors.secondary,
//                       width: widget.width ?? screenWidth,
//                       height: widget.height ?? 40,
//                       text: widget.options[index],
//                       isSelected: index == selectedOptionIndex,
//                       onTap: () {
//                         setState(() {
//                           selectedOptionIndex = index;
//                         });
//                         if (widget.onTap != null) {
//                           widget.onTap!(index);
//                         }
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: AppSizes.padding * 2),
//           IndexedStack(
//             index: selectedOptionIndex,
//             children: widget.pages,
//           ),
//         ],
//       ),
//     );
//   }
// }
