import '../config/locale/local_lang.dart';
import '../constants/app_assets.dart';

enum PaymentMethod {
  instaPay(AppAssets.instaPay),
  wallet(AppAssets.wallet);

  final String image;

  const PaymentMethod(this.image);

  String get toJson => this == instaPay ? 'instapay' : 'wallet';
  
  factory PaymentMethod.fromString(String? inString) {
    switch (inString) {
      case 'instapay':
        return instaPay;
      case 'wallet':
        return wallet;
    }
    return instaPay;
  }

  String get name =>
      this == instaPay ? localeLang().instapay : localeLang().wallet;
}
