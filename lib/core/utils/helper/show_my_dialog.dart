import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/dashboard/presentation/controller/dashboard_controller.dart';
import '../../shared/dialog/custom_dialog.dart';
import '../config/locale/local_lang.dart';

abstract final class ShowMyDialog extends GetView<DashboardController>{
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

  static Future<bool?> removeAccount([void Function()? onPressRemove]) async {
    final bool? result = await Get.dialog<bool>(
      CustomDialog(
        title: localeLang().delete_account,
        body: localeLang().do_you_want_to_delete_your_account,
        crossAxisAlignment: CrossAxisAlignment.center,
        textCancel: localeLang().delete_account,
        onPressCancel: () {
          Get.back();
          if (onPressRemove != null) onPressRemove();
        },
        textConfirm: localeLang().cancel,
        onPressConfirm: Get.back,
      ),
    );
    return result;
  }
  static Future<bool?> logout([void Function()? onPressRemove]) async {
    final bool? result = await Get.dialog<bool>(
      CustomDialog(
        title: localeLang().logOut,
        body: localeLang().do_you_want_to_logout,
        crossAxisAlignment: CrossAxisAlignment.center,
        textCancel: localeLang().logOut,
        onPressCancel: () {
          Get.back();
          if (onPressRemove != null) onPressRemove();
        },
        textConfirm: localeLang().cancel,
        onPressConfirm: Get.back,
      ),
    );
    return result;
  }
}
