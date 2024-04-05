import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utility/console_log.dart';
import 'local_notif_service.dart';

// FCM Service
// v.2.0.3
// by Elriz Wiraswara

class FcmService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  FcmService._();

  static String? fcmToken;

  static Future<void> initNotification({
    Function(RemoteMessage)? onMessageHandler,
    Function(RemoteMessage)? onBackgroundHandler,
    bool alert = true,
    bool badge = true,
    bool provisional = false,
    bool sound = true,
    List<String>? topics,
  }) async {
    // Get fcm token
    fcmToken = await FirebaseMessaging.instance.getToken();
    cl('[FcmService].fcmToken = $fcmToken');

    // On iOS, this helps to take the user permissions
    final settings = await FirebaseMessaging.instance.requestPermission(
      alert: alert,
      badge: badge,
      provisional: provisional,
      sound: sound,
    );

    if (topics != null && topics.isNotEmpty) {
      for (var topic in topics) {
        await FirebaseMessaging.instance.subscribeToTopic(topic);
      }
    }

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _notificationHandler(
        onMessageHandler: onMessageHandler ?? (msg) {},
        onBackgroundHandler: onBackgroundHandler ?? (msg) {},
      );

      await _checkForInitialMessage();
    } else {
      cl('[FcmService] User declined or has not accepted permission');
    }
  }

  static Future<void> _notificationHandler({
    required Function(RemoteMessage) onMessageHandler,
    required Function(RemoteMessage) onBackgroundHandler,
  }) async {
    // Foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _onMessageHandler(message: message, onMessageHandler: onMessageHandler);
    });

    // Background
    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) {
      return onBackgroundHandler(message);
    });
  }

  static Future<void> _onMessageHandler({
    required RemoteMessage message,
    required Function(RemoteMessage) onMessageHandler,
  }) async {
    await LocalNotifService.showNotification(
      title: message.notification?.title,
      body: message.notification?.body,
      payload: jsonEncode(message.data),
    );

    onMessageHandler(message);

    cl("[FcmService]._onMessageHandler.data = ${message.data}");
  }

  // For handling notification when the app is in terminated state
  static Future<RemoteMessage?> _checkForInitialMessage() async {
    var initialMessage = await FirebaseMessaging.instance.getInitialMessage();

    cl("[FcmService]._checkForInitialMessage.data = ${initialMessage?.data}");

    return initialMessage;
  }

  static Future<void> unsubscribeTopics(List<String> topics) async {
    if (topics.isNotEmpty) {
      for (var topic in topics) {
        await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
      }
    }
  }
}
