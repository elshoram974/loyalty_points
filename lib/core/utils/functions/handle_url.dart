import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'show_my_snack_bar.dart';

Future<void> launchURL(String url) async {
  try {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw '${localeLang().couldNotLaunch} $url';

    }
  } catch (e) {
    ShowMySnackBar.call(
      e.toString(),
      backgroundColor: Get.theme.colorScheme.error,
    );
  }
}