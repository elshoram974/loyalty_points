import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import 'core/utils/config/locale/generated/l10n.dart';
import 'core/utils/config/locale/locale_model.dart';

abstract final class AppInfo {
  const AppInfo();

  static const String baseURL = "https://points.petrojac.com";

  static const String appName = "Loyalty Points";
  static const String appId = "com.petrojac.loyaltyPoints";
  static const String appVersion = "1.0.0";
  static const int appBuildVersion = 1;

  /// country code like in locale to make initialize in phone fields
  static const String initCountryIsoCode = 'EG';

  // static const bool isDebugMode = false;
  static const bool isDebugMode = kDebugMode;

  /// To add locale .. You have to add it in package(flutter intel)
  /// and add text in its file .arb and don't forget to add it in info.plist file
  static List<LocaleModel> get supportedLocales => LocaleModel.fromLocales(
      Get.find<AppLocalizationDelegate>().supportedLocales);

  // static const String appIcon = AppAssets.appIcon;
  // static const String splashIcon = AppAssets.splashIcon;
  // static const String splashAndroid12 = AppAssets.splashAndroid12;
}
