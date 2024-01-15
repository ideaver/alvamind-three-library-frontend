import 'package:flutter/material.dart';

// App Colors
class AppColors {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  AppColors._();

  // Main App Color
  static MaterialColor mainColor = createMaterialColor(primary);

  // Convert Color into MaterialColor
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  // Native Colors
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;

  // Named Colors
  static const Color primary = blueLv1;
  static const Color secondary = yellowLv1;
  static const Color success = greenLv1;
  static const Color info = blueLv1;
  static const Color warning = yellowLv1;
  static const Color error = redLv1;
  static const Color disabled = blackLv6;
  static const Color disabledButton = darkBlueLv1;

  // Blue
  static const Color blueLv1 = Color(0xFF246BFD);
  static const Color blueLv2 = Color(0xFF5089FD);
  static const Color blueLv3 = Color(0xFF7CA6FE);
  static const Color blueLv4 = Color(0xFFA7C4FE);
  static const Color blueLv5 = Color(0xFFE9F0FF);

  // Dark Blue
  static const Color darkBlueLv1 = Color(0xFF3062C8);
  static const Color darkBlueLv2 = Color(0xFF4C77CF);
  static const Color darkBlueLv3 = Color(0xFF678CD7);
  static const Color darkBlueLv4 = Color(0xFF83A1DE);
  static const Color darkBlueLv5 = Color(0xFF9EB6E5);
  static const Color darkBlueLv6 = Color(0xFFBACBED);
  static const Color darkBlueLv7 = Color(0xFFD6E0F4);

  // Yellow
  static const Color yellowLv1 = Color(0xFFFFD300);
  static const Color yellowLv2 = Color(0xFFFFDC33);
  static const Color yellowLv3 = Color(0xFFFFE566);
  static const Color yellowLv4 = Color(0xFFFFED99);
  static const Color yellowLv5 = Color(0xFFFFFBE6);

  // Black
  static const Color blackLv1 = Color(0xFF212121);
  static const Color blackLv2 = Color(0xFF424242);
  static const Color blackLv3 = Color(0xFF616161);
  static const Color blackLv4 = Color(0xFF757575);
  static const Color blackLv5 = Color(0xFF9E9E9E);
  static const Color blackLv6 = Color(0xFFBDBDBD);
  static const Color blackLv7 = Color(0xFFE0E0E0);
  static const Color blackLv8 = Color(0xFFEEEEEE);
  static const Color blackLv9 = Color(0xFFF5F5F5);
  static const Color blackLv10 = Color(0xFFFAFAFA);

  // Green
  static const Color greenLv1 = Color(0xFF07BD74);
  static const Color greenLv2 = Color(0xFF28C687);
  static const Color greenLv3 = Color(0xFF49CF99);
  static const Color greenLv4 = Color(0xFF6AD7AC);
  static const Color greenLv5 = Color(0xFF8BE0BE);
  static const Color greenLv6 = Color(0xFFACE9D1);
  static const Color greenLv7 = Color(0xFFCDF2E3);
  static const Color greenLv8 = Color(0xFFE0F6ED);

  // Red
  static const Color redLv1 = Color(0xFFF75555);
  static const Color redLv2 = Color(0xFFF86C6C);
  static const Color redLv3 = Color(0xFFF98282);
  static const Color redLv4 = Color(0xFFFA9999);
  static const Color redLv5 = Color(0xFFFBB0B0);
  static const Color redLv6 = Color(0xFFFCC6C6);
  static const Color redLv7 = Color(0xFFFFF3F3);
  // Orange
  static const Color orangeLv1 = Color(0xFFFB9400);

  // Amber
  static const Color amberLv1 = Color(0xFFFFC02D);

  // Pink
  static const Color pinkLv1 = Color(0xFFEA1E61);

  // Teal
  static const Color tealLv1 = Color(0xFF009689);

  // Indigo
  static const Color indigoLv1 = Color(0xFF3F51B2);

  // Lime
  static const Color limeLv1 = Color(0xFFCDDC4C);

  // Blue Gray
  static const Color blueGrayLv1 = Color(0xFF607D8A);

  // Purple
  static const Color purpleLv1 = Color(0xFF9D28AC);
  static const Color purpleLv2 = Color(0xFF7210FF);

  // Cyan
  static const Color cyanLv1 = Color(0xFF00BCD3);

  // Brown
  static const Color brownLv1 = Color(0xFF7A5548);
}
