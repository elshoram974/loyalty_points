import '../config/locale/local_lang.dart';
import '../constants/app_assets.dart';

enum PaymentMethod {
  instaPay(AppAssets.instaPay),
  wallet(AppAssets.wallet);

  final String image;

  const PaymentMethod(this.image);

  String get toJson => this == instaPay ? 'instapay' : 'wallet';

  String get name =>
      this == instaPay ? localeLang().instapay : localeLang().wallet;
}
