import 'package:flutter/material.dart';
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

  factory LocaleModel.fromLocale(Locale locale){
    return LocaleModel(
      languageName: intl.Intl.canonicalizedLocale(locale.toString()),
      languageCode: locale.languageCode,
      countryCode: locale.countryCode,
    );
  }
  static List<LocaleModel> fromLocales(List<Locale> locals){
    final List<LocaleModel> temp = [];
    for(int i = 0; i < locals.length; i++){
      temp.add(LocaleModel.fromLocale(locals[i]));
    }

    return temp;
  }
}
