import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_filex/open_filex.dart';

import '../../utility/external_launcher.dart';
import '../navigation/navigation_service.dart';

// Local Notification Service
// v.2.0.1
// by Elriz Wiraswara

class LocalNotifService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  LocalNotifService._();

  // Flutter local notification plugin
  static final localNotifPlugin = FlutterLocalNotificationsPlugin();

  // Initilaization settings
  static const androidInitSettings = AndroidInitializationSettings('@mipmap/ic_launcher');

  static const iosInitSettings = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );

  // Notification details settings
  static late AndroidNotificationDetails androidNotifDetails;

  static late DarwinNotificationDetails iosNotifDetails;

  static late NotificationDetails notificationDetails;

  static Future<void> initLocalNotifService({
    required String packageName,
    required String channelName,
    String? categoryIdentifier,
    String? description,
    Importance importance = Importance.defaultImportance,
    Priority priority = Priority.high,
  }) async {
    androidNotifDetails = androidNotifDetails = AndroidNotificationDetails(
      packageName,
      channelName,
      channelDescription: description,
      importance: importance,
      priority: priority,
    );

    iosNotifDetails = iosNotifDetails = DarwinNotificationDetails(
      categoryIdentifier: categoryIdentifier,
    );

    notificationDetails = notificationDetails = NotificationDetails(
      android: androidNotifDetails,
      iOS: iosNotifDetails,
    );

    var notifAppLaunchDetails = await localNotifPlugin.getNotificationAppLaunchDetails();

    if (notifAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      onDidReceiveNotif(notifAppLaunchDetails!.notificationResponse!);
    }

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await localNotifPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotif,
    );
  }

  static void onDidReceiveNotif(NotificationResponse res) async {
    if (res.notificationResponseType == NotificationResponseType.selectedNotification) {
      if (res.payload == null || res.payload == '') {
        return;
      }

      if (await File(res.payload!).exists()) {
        OpenFilex.open(res.payload);
      } else if (res.payload!.contains('http')) {
        ExternalLauncher.openUrl(res.payload!);
      } else {
        NavigationService.navigatorKey.currentState?.pushNamed(res.payload!);
      }
    }
  }

  static Future<void> showNotification({
    required String? title,
    required String? body,
    String? deepLink,
  }) async {
    await localNotifPlugin.show(
      body.hashCode,
      title,
      body,
      notificationDetails,
      payload: deepLink,
    );
  }

  static Future<void> showDownloadProgressNotification({
    required String? title,
    required String? body,
    required String? payload,
    required int count,
    required int i,
    required int id,
  }) async {
    //show the notifications.
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      body.hashCode.toString(),
      'Download Progess Channel',
      channelDescription: 'Download Progess Notification Channel',
      channelShowBadge: false,
      importance: Importance.max,
      priority: Priority.high,
      onlyAlertOnce: true,
      showProgress: true,
      maxProgress: count,
      progress: i,
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    await localNotifPlugin.show(
      id++,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
