import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

final FirebaseMessaging fcm = FirebaseMessaging.instance;

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  '0', // id
  'High Importance Notifications', // title
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

    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    getDeviceToken();

    FirebaseMessaging.onMessage.listen((event) async{
      print("onLaunch: ${jsonEncode(event.toMap())}");
      if(Platform.isIOS) {
        _showIosMessage(event);
        return;
      }
      //(Map<String, dynamic> message) async => _showMessage(message);
      final RemoteNotification? notification = event.notification;

      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();

      const DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );


      final AndroidNotification? android = notification?.android;
      const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/notification_icon'); 

      const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

      BigPictureStyleInformation? bigPictureStyle;
      FilePathAndroidBitmap? image;
      if(android?.imageUrl != null){
        final String largeIconPath = await _downloadAndSaveFile(android!.imageUrl!, 'largeIcon');
        image = FilePathAndroidBitmap(largeIconPath);
        bigPictureStyle = BigPictureStyleInformation(
            image, 
            contentTitle: notification?.title,
            summaryText: notification?.body,
            hideExpandedLargeIcon: true,
          );

      }
      
      final AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
          channel.id,
          channel.name,
          importance: Importance.max,
          priority: Priority.max,
          icon: android?.smallIcon,
          styleInformation: bigPictureStyle,
          largeIcon: image,
        );
      
      const DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

      

      flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          _navigate(jsonDecode(details.payload ??'{}'));
        },
      );


      if (notification != null) {
        return flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(android: androidNotificationDetails, iOS: darwinNotificationDetails),
          payload: jsonEncode(event.toMap()),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onResume: ${message.toMap()}");
      _navigate(message.toMap());
    });
  }
  static Future<String> _downloadAndSaveFile(String url, String fileName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String filePath = '${directory.path}/$fileName';
    await Get.find<dio.Dio>().download(url, filePath);
    return filePath;
  }

  static Future<String> getDeviceToken() async {
    deviceToken = await fcm.getToken() ?? '';
    print("fcmToken $deviceToken");
    return deviceToken!;
  }

  static void _showIosMessage(RemoteMessage message) {
    //print("onMessage: $message");

    // OneContext().showDialog(
    //   // barrierDismissible: false,
    //   barrierDismissible: false,
    //   builder: (context) => AlertDialog(
    //     content: ListTile(
    //       title: Text(message.notification!.title!),
    //       subtitle:message.notification?.apple?.imageUrl == null ? Text(message.notification!.body!) : _dialogImageBody(message),
    //     ),
    //     actions: <Widget>[
    //       Btn.basic(
    //         child: Text(LangText(context).local.close_ucf),
    //         onPressed: () => Navigator.of(context).pop(),
    //       ),
    //       Btn.basic(
    //         child: Text(LangText(context).local.go),
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //           _serialiseAndNavigate(message.toMap());
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }

  static void _navigate(Map<String, dynamic> message) {
    // if (is_logged_in.$ == false) {
    //   OneContext().showDialog(
    //       // barrierDismissible: false,
    //       builder: (context) => AlertDialog(
    //             title:  Text(LangText(context).local.you_are_not_logged_in),
    //             content:  Text(LangText(context).local.please_log_in),
    //             actions: <Widget>[
    //               Btn.basic(
    //                 child: Text(LangText(context).local.close_ucf),
    //                 onPressed: () => Navigator.of(context).pop(),
    //               ),
    //               Btn.basic(
    //                   child: Text(LangText(context).local.log_in),
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                     OneContext().push(MaterialPageRoute(builder: (_) {
    //                       return Login();
    //                     }));
    //                   }),
    //             ],
    //           ));
    //   return;
    // }
    // if (message['data']['item_type'] == 'order') {
    //   OneContext().push(MaterialPageRoute(builder: (_) {
    //     return OrderDetails(
    //         id: int.parse(message['data']['item_type_id']),
    //         from_notification: true);
    //   }));
    // }else{
    //   NavigationService.handleUrls(message['data']['link']); 
    // }
  }
}

// class _dialogImageBody extends StatelessWidget {
//   const _dialogImageBody(this.message);
//   final RemoteMessage message;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(height: 16),
//         Text(message.notification!.body!),
//         const SizedBox(height: 16),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(
//             message.notification!.apple!.imageUrl!,
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child;
//               return ShimmerHelper().buildBasicShimmer(height: 120.0);
//             },
//           )
//         ),
//       ],
//     );
//   }
// }
