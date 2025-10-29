import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import '../../../app_info.dart';
import '../../status/errors/failure_body.dart';
import '../../status/errors/server_failure.dart';
import '../../status/status.dart';

Future<Status<T>> executeAndHandleErrors<T>(
  Future<T> Function() function, [
  Future<T?> Function()? functionWhenError,
]) async {
  try {
    return Success<T>(await function());
  } catch (e, s) {
    FirebaseCrashlytics.instance.recordError(e, s);
    if (AppInfo.isDebugMode) print("error: $e");

    T? data;
    if (functionWhenError != null) data = await functionWhenError();

    if (e is DioException) {
      if (AppInfo.isDebugMode) print("DioException: ${e.response}");
      return ServerFailure<T>.fromDioException(e).copyWith(data: data);
    }

    return Failure<T>(FailureBody(message: e.toString()), data);
  }
}
