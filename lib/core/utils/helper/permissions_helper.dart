import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../config/locale/local_lang.dart';
import 'show_my_dialog.dart';
import 'show_my_snack_bar.dart';

abstract final class HandlePermissions {
  static Future<Position?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever ||
        permission == LocationPermission.unableToDetermine) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ShowMySnackBar.error(localeLang().locationIsDenied);
      } else if (permission == LocationPermission.deniedForever) {
        ShowMySnackBar.reRequestPermissionToast(
          text: localeLang().locationIsDeniedPermanently,
          actionText: localeLang().goToSetting,
          onPressed: Geolocator.openAppSettings,
        );
      }
      return null;
    }

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await ShowMyDialog.locationDialog();
      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  // static  Future<bool> requestCameraPermission() async {
  //   PermissionStatus status = await Permission.camera.status;
  //   if (!status.isGranted) {
  //     status = await Permission.camera.request();
  //   }
  //   return status.isGranted;
  // }
}
