import 'dart:async';

import 'package:get/get.dart';

import '../../status/errors/failure.dart';
import '../../status/status.dart';
import '../../status/success/success.dart';
import 'show_my_snack_bar.dart';

FutureOr<T?> handleResponseInController<T>({
  required Status<T> status,
  required FutureOr<T?> Function(T data) onSuccess,
}) {
  if (status is Success<T>) return onSuccess(status.data);

  if (status is Failure<T>) {
    ShowMySnackBar.call(
      status.failure.message ?? 'unknown',
      backgroundColor: Get.theme.colorScheme.error,
    );
  }
  return null;
}
