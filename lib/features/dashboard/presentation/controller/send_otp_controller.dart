import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

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
        print("Password reset request successful");
        return true;
      } else {
        Get.snackbar(
          "Error",
          response.data['message'] ?? localeLang().error,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } on DioException catch (e) {
      Get.snackbar(
        "Network Error",
        e.response?.data['message'] ?? localeLang().pleaseTryAgain,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }
}
