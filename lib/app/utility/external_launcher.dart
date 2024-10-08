import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

// App External Launcher
// v.1.0.1
// by Elriz Wiraswara

// External launcher
class ExternalLauncher {
  ExternalLauncher._();

  static void openUrl(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } on Exception {
      throw Exception('Could not launch $url');
    }
  }

  static void openWhatsApp({
    required String phone,
    required String message,
  }) async {
    var androidUrl = "whatsapp://send?phone=$phone&text=${Uri.encodeComponent(message)}";
    var iosUrl = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      throw Exception('WhatsApp is not installed.');
    }
  }

  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (!await launchUrl(Uri.parse(googleUrl))) {
      throw Exception('Could open map url $googleUrl');
    }
  }
}
