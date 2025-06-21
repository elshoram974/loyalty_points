import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

final FirebaseMessaging fcm = FirebaseMessaging.instance;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.max,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationService {
  static String? deviceToken;
  static Future<void> initialize() async {
    await fcm.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    getDeviceToken();

    _initLocalNotification();

    FirebaseMessaging.onMessage.listen((event) async {
      log("onMessage: ${jsonEncode(event.toMap())}");

      if (Platform.isIOS) return; // handled natively
      final RemoteNotification? notification = event.notification;

      final AndroidNotification? android = notification?.android;
      // final AppleNotification? apple = notification?.apple;

      BigPictureStyleInformation? bigPictureStyle;
      FilePathAndroidBitmap? androidImage;
      // List<DarwinNotificationAttachment>? iosImages;
      if (android?.imageUrl != null) {
        final String largeIconPath =
            await _downloadAndSaveFile(android!.imageUrl!, 'largeIcon');
        androidImage = FilePathAndroidBitmap(largeIconPath);
        bigPictureStyle = BigPictureStyleInformation(
          androidImage,
          contentTitle: notification?.title,
          summaryText: notification?.body,
          hideExpandedLargeIcon: true,
        );
      }
      // else if (apple?.imageUrl != null) {
      //   final String notificationImage =
      //       await _downloadAndSaveFile(apple!.imageUrl!, 'notification_image');

      //   iosImages = List.unmodifiable(
      //     [DarwinNotificationAttachment(notificationImage)],
      //   );
      // }

      final AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        channel.id,
        channel.name,
        importance: Importance.max,
        priority: Priority.max,
        icon: android?.smallIcon,
        styleInformation: bigPictureStyle,
        largeIcon: androidImage,
      );

      // DarwinNotificationDetails darwinNotificationDetails =
      //     DarwinNotificationDetails(
      //   attachments: iosImages,
      //   presentAlert: true,
      //   presentBadge: true,
      //   presentSound: true,
      //   subtitle: apple?.subtitle,
      //   badgeNumber: int.tryParse("${apple?.badge}"),
      // );

      if (notification != null) {
        return flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: androidNotificationDetails,
            // iOS: darwinNotificationDetails,
          ),
          payload: jsonEncode(event.toMap()),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log("onResume: ${jsonEncode(message.toMap())}");
    });
  }

  static void _initLocalNotification() {
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/notification_icon');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        log("onDidReceiveNotificationResponse: ${jsonDecode(details.payload ?? '{}')}");
      },
    );
  }

  static Future<String> _downloadAndSaveFile(
    String url,
    String fileName,
  ) async {
    final Directory directory = await getApplicationDocumentsDirectory();

    String ext = url.split(".").lastOrNull ?? 'png';

    final String filePath = '${directory.path}/$fileName.$ext';

    await Get.find<dio.Dio>().download(url, filePath);

    return filePath;
  }

  static Future<String> getDeviceToken() async {
    // if (Platform.isIOS) {
    //   deviceToken = await fcm.getAPNSToken();
    // } else {
    deviceToken = await fcm.getToken() ?? '';
    // }
    log("fcmToken $deviceToken");
    return deviceToken!;
  }
}
