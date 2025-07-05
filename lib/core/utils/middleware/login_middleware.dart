import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_info.dart';
import '../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../config/routes/routes.dart';

class LoginMiddleWare extends GetMiddleware {
  LoginMiddleWare(this.authLocal);
  final AuthLocalDataSource authLocal;
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (authLocal.getCurrentUser() != null && !AppInfo.useLocalAuth) {
      return const RouteSettings(name: AppRoute.home);
    }

    return null;
  }
}
