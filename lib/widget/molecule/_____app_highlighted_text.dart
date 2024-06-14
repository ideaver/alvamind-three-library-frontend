// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// // AppHighlightedText
// // v.0.0.1
// // by Elriz Wiraswara

// // Match: @username
// final usernameOnlyPattern = RegExp(r"^[A-Za-z0-9_.]{3,20}$");

// // Match: http://google.com, https://google.com, google.com, www.google.com
// final urlOnlyPattern = RegExp(r'\b((https?:\/\/[^\s]+)|(www\.[^\s]+)|([^\s]+\.[^\s]+))\b');

// // Combination of [usernameOnlyPattern] and [urlOnlyPattern]
// final usernameAndUrlPattern = RegExp(r'\B@\w+|\b((https?:\/\/[^\s]+)|(www\.[^\s]+)|([^\s]+\.[^\s]+))\b');

// class AppHighlightedText extends StatelessWidget {
//   final String text;
//   final RegExp pattern;
//   final TextStyle normalStyle;
//   final TextStyle highlightedStyle;
//   final Function(String) onTap;

//   const AppHighlightedText({
//     super.key,
//     required this.text,
//     required this.pattern,
//     this.normalStyle = const TextStyle(color: Colors.black),
//     this.highlightedStyle = const TextStyle(color: Colors.red),
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       text: _highlightText(text, pattern),
//     );
//   }

//   TextSpan _highlightText(String text, RegExp pattern) {
//     if (!pattern.hasMatch(text)) {
//       return TextSpan(text: text, style: normalStyle);
//     }

//     final List<TextSpan> spans = [];

//     text.splitMapJoin(
//       pattern,
//       onMatch: (match) {
//         spans.add(
//           TextSpan(
//             text: match[0],
//             style: highlightedStyle,
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 onTap(match[0]!);
//               },
//           ),
//         );
//         return match[0]!;
//       },
//       onNonMatch: (nonMatch) {
//         spans.add(TextSpan(text: nonMatch, style: normalStyle));
//         return nonMatch;
//       },
//     );

//     return TextSpan(children: spans);
//   }
// }
