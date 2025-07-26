import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/utils/helper/show_my_snack_bar.dart';

class AuthController extends GetxController {
  final Dio _dio = Dio();

  Future<bool> requestPasswordReset(String phone) async {
    try {
      final response = await _dio.post(
        //link
        'https://webhook.site/71a18cd7-cb36-48ab-a92f-f49d50d64ef0',
        data: {'phone': phone},
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        ShowMySnackBar.error(
          localeLang(Get.context!).error,
        );
        return false;
      }
    } on DioException {
      ShowMySnackBar.error(
        localeLang(Get.context!).error,
      );
      return false;
    }
  }
}
