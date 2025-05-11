import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/local_lang.dart';

abstract final class ShowMyDialog {
  const ShowMyDialog();

  static Future<T> loading<T>(Future<T> Function() asyncFunction) {
    return Get.showOverlay<T>(
      loadingWidget: const Center(child: CircularProgressIndicator()),
      asyncFunction: asyncFunction,
    );
  }

  static void error(BuildContext context, {required String body}) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: localeLang(context).error,
          body: body,
          crossAxisAlignment: CrossAxisAlignment.center,
          textCancel: localeLang(context).understood,
          onPressCancel: Get.back,
        );
      },
    );
  }

  static Future<bool?> back({
    String? body,
    void Function()? onGoBack,
  }) async {
    final bool? result = await Get.dialog<bool>(
      CustomDialog(
        title: localeLang().goBack,
        body: body ?? localeLang().areYouSureYouWantToReturnBack,
        crossAxisAlignment: CrossAxisAlignment.center,
        textCancel: localeLang().goBack,
        onPressCancel: () {
          if (onGoBack != null) onGoBack();
          Get.back(result: true);
        },
        textConfirm: localeLang().stayHere,
        onPressConfirm: Get.back,
      ),
    );
    return result;
  }
}
