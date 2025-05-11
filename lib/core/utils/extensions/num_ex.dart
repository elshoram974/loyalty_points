
import 'package:intl/intl.dart';

extension NumbersHelper on num {
  String get locale => localeCustomPattern('#.###############');
  
  String custom([String? newPattern, String? locale]) {
    return NumberFormat(newPattern, locale).format(this);
  }
  String customLocale(String locale) => custom(null, locale);
  String localeCustomPattern(String pattern) => custom(pattern);

  String get withSeparator => localeCustomPattern('#,##0');
}
