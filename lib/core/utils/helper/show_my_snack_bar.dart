import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_constants.dart';

abstract final class ShowMySnackBar {
  const ShowMySnackBar();

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> call(
    String content, {
    Duration? duration,
    TextStyle? style,
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    final BuildContext context = Get.context!;
    final ScaffoldMessengerState scaffold = ScaffoldMessenger.of(context);
    scaffold.clearSnackBars();
    return scaffold.showSnackBar(
      SnackBar(
        width: context.isPhone ? null : 400,
        content: Text(
          content,
          textAlign: TextAlign.center,
          style: style ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: backgroundColor == null ? null : Colors.white,
              ),
        ),
        action: action,
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.radiusDefault),
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: context.isPhone
            ? const EdgeInsets.all(AppConst.paddingDefault)
            : null,
        duration: duration ?? AppConst.duration,
        actionOverflowThreshold: 1,
      ),
    );
  }

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      reRequestPermissionToast({
    required String text,
    required String actionText,
    required void Function() onPressed,
  }) {
    return call(
      text,
      duration: const Duration(seconds: 5),
      backgroundColor: Get.theme.colorScheme.error,
      action: SnackBarAction(
        label: actionText,
        onPressed: onPressed,
        textColor: Get.theme.primaryColor,
      ),
    );
  }
}
