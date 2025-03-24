
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../config/locale/local_lang.dart';

enum FieldType { name, email, password, rePassword, other }

abstract final class AppValidator {
  const AppValidator();

  static String? samePassword(String? current, String previous) {
    if (current == null || current.trim() == "") return localeLang().fillField;

    if (previous != current) return localeLang().notSamePass;

    return null;
  }

  static String? auth(
    String? value,
    int min,
    int max,
    FieldType field,
  ) {
    assert(min <= max);
    if (value == null || value.trim() == "") return localeLang().fillField;

    switch (field) {
      case FieldType.email:
        if (!isEmail(value)) return localeLang().enterValidEmail;

      default:
    }

    if (value.length < min) {
      return localeLang().cantBeLessThan(min.locale);
    } else if (value.length > max) {
      return localeLang().cantBeMoreThan(max.locale);
    }

    return null;
  }

  static String? notEmpty(String? value) {
    if (value == null || value.trim() == "") return localeLang().fillField;
    return null;
  }
}

bool isEmail(email) {
  const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  return RegExp(emailRegExp).hasMatch(email);
}
