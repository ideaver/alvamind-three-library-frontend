import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../utility/external_launcher.dart';
import '../navigation/navigation_service.dart';

// Local Notification Service
// v.2.0.2
// by Elriz Wiraswara

class LocalNotifService {
  // This class is not meant to be instatiated or extended; this constructor
  // prevents instantiation and extension.
  LocalNotifService._();

  static late final String defaultPackageName;
  static late final String defaultChannelName;

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
    Function(NotificationResponse)? onDidReceiveNotificationResponse,
  }) async {
    defaultPackageName = packageName;
    defaultChannelName = channelName;

    androidNotifDetails = AndroidNotificationDetails(
      packageName,
      channelName,
      channelDescription: description,
      importance: importance,
      priority: priority,
      icon: '@mipmap/ic_launcher',
    );

    iosNotifDetails = DarwinNotificationDetails(
      categoryIdentifier: categoryIdentifier,
    );

    notificationDetails = NotificationDetails(
      android: androidNotifDetails,
      iOS: iosNotifDetails,
    );

    var notifAppLaunchDetails = await localNotifPlugin.getNotificationAppLaunchDetails();

    if (notifAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      onDidReceiveNotificationResponse ?? onDidReceiveNotif(notifAppLaunchDetails!.notificationResponse!);
    }

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    await localNotifPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse ?? onDidReceiveNotif,
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
    String? image,
    String? payload,
  }) async {
    await localNotifPlugin.show(
      body.hashCode,
      title,
      body,
      payload: payload,
      image == null
          ? notificationDetails
          : NotificationDetails(
              android: AndroidNotificationDetails(
                defaultPackageName,
                defaultChannelName,
                styleInformation: await _buildBigPictureStyleInformation(image),
              ),
              // TODO
              iOS: const DarwinNotificationDetails(),
            ),
    );
  }

  static Future<BigPictureStyleInformation?> _buildBigPictureStyleInformation(String image) async {
    final imgPath = await _downloadAndSaveFile(image, "notifImage");

    final FilePathAndroidBitmap filePath = FilePathAndroidBitmap(imgPath);

    return BigPictureStyleInformation(
      filePath,
      htmlFormatContentTitle: true,
      htmlFormatSummaryText: true,
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

  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    final http.Response response = await http.get(Uri.parse(url));
    final File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }
}
