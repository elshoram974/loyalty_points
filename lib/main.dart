import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_info.dart';
import 'core/utils/bindings/initial_bindings.dart';
import 'core/utils/config/controller/config_controller.dart';
import 'core/utils/config/locale/generated/l10n.dart';
import 'core/utils/config/routes/routes.dart';
import 'core/utils/config/theme/dark_theme.dart';
import 'core/utils/config/theme/light_theme.dart';
import 'core/utils/helper/network_helper.dart';
import 'core/utils/services/push_notification_service.dart';
import 'firebase_options.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Handling a background message ${jsonEncode(message.toMap())}');
}

void main() async {
  if (AppInfo.isDebugMode) HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      Hive.initFlutter(),
    ],
  );
  await InitialBindings.dependencies();
  await NotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(
    DevicePreview(
      enabled: AppInfo.isDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      useInheritedMediaQuery: AppInfo.isDebugMode,
      locale: Get.find<ConfigController>().locale,
      builder: DevicePreview.appBuilder,
      title: AppInfo.appName,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      getPages: AppRoute.pages,
      initialRoute: AppRoute.login,
      debugShowCheckedModeBanner: AppInfo.isDebugMode,
      initialBinding: BindingsBuilder(
        () async {
          // await S.load(Get.find<ConfigController>().locale);
          await NetworkInfo.init();
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
