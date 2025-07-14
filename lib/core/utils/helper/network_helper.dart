import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../config/locale/local_lang.dart';
import 'show_my_snack_bar.dart';

class NetworkInfo {
  const NetworkInfo();

  static Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivity =
        await Connectivity().checkConnectivity();

    return !connectivity.contains(ConnectivityResult.none);
  }

  /// This getter returns true if no internet connection,
  /// and will show snackbar that return no internet connection
  static Future<bool> get showSnackBarWhenNoInternet async {
    if (await isConnected) return false;
    ShowMySnackBar.call(
      localeLang().noInternetConnection,
      duration: const Duration(seconds: 3),
      backgroundColor: Get.theme.colorScheme.error,
    );
    return true;
  }
}
