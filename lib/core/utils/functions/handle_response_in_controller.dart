import 'dart:async';

import 'package:get/get.dart';

import '../../status/errors/failure.dart';
import '../../status/status.dart';
import '../../status/success/success.dart';
import 'show_my_snack_bar.dart';

FutureOr<void> handleResponseInController<T>({
  required Status<T> status,
  required FutureOr<void> Function(T data) onSuccess,
  FutureOr<void> Function(T? data)? onError,
}) {
  if (status is Success<T>) return onSuccess(status.data);

  if (status is Failure<T>) {
    handleFailureStatus(status);
    onError?.call(status.data);
  }
  return null;
}

void handleFailureStatus<T>(Failure<T> status) {
  ShowMySnackBar.call(
    status.failure.message ?? 'unknown',
    backgroundColor: Get.theme.colorScheme.error,
  );
}
