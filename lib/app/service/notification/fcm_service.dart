import 'package:firebase_messaging/firebase_messaging.dart';

import '../../utility/console_log.dart';
import 'local_notif_service.dart';

// FCM Service
// v.2.0.1
// by Elriz Wiraswara

class FcmService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  FcmService._();

  static String? fcmToken;

  static Future<void> initNotification({
    required Function(RemoteMessage) onMessageHandler,
    required Function(RemoteMessage) onBackgroundHandler,
    bool alert = true,
    bool badge = true,
    bool provisional = false,
    bool sound = true,
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

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      await _notificationHandler(
        onMessageHandler: onMessageHandler,
        onBackgroundHandler: onBackgroundHandler,
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
      deepLink: message.data['deep_link'],
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
}
