import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:intl/intl.dart' as intl;

class LocaleModel {
  const LocaleModel({
    required this.languageName,
    required this.languageCode,
    this.countryCode,
  });
  final String languageName;
  final String languageCode;
  final String? countryCode;

  Locale get toLocale => Locale(languageCode, countryCode);

  factory LocaleModel.fromLocale(Locale locale) {
    return LocaleModel(
      languageName: LocaleNamesLocalizationsDelegate
              .nativeLocaleNames[locale.languageCode] ??
          intl.Intl.canonicalizedLocale(locale.languageCode),
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
    );
  }
  static List<LocaleModel> fromLocales(List<Locale> locals) {
    final List<LocaleModel> temp = [];
    for (int i = 0; i < locals.length; i++) {
      temp.add(LocaleModel.fromLocale(locals[i]));
    }

    return temp;
  }
}
