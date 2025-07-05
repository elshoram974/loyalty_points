import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local_auth/local_auth.dart';

import '../../../../app_info.dart';
import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/helper/network_helper.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../dashboard/presentation/controller/dashboard_controller.dart';
import '../../data/models/user_model.dart';
import '../../domain/entity/login_request_data.dart';
import '../../domain/repositories/auth_repositories.dart';

abstract class LoginController extends GetxController {
  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PhoneNumber? phone;
  String password = '';

  bool get showBiometricsButton;

  Future<void> login();

  Future<void> biometricsLogin();

  void onPopInvoked();
}

class LoginControllerImp extends LoginController {
  final AuthRepositories repo;
  final DashboardController dashController;
  final APIServices apiServices;
  LoginControllerImp({
    required this.repo,
    required this.dashController,
    required this.apiServices,
  });
  final LocalAuthentication localAuth = LocalAuthentication();

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  bool _canAuthenticate = false;

  @override
  bool get showBiometricsButton =>
      _canAuthenticate && apiServices.token?.isNotEmpty == true;

  // @override
  // void onInit() {
  //   checkAuthenticate();
  //   super.onInit();
  // }

  @override
  void onReady() {
    if (AppInfo.useLocalAuth) biometricsLogin();
    super.onReady();
  }

  Future<void> checkAuthenticate() async {
    final List<bool> auth = await Future.wait([
      localAuth.isDeviceSupported(),
      localAuth.canCheckBiometrics,
    ]);
    _canAuthenticate = auth[0] && auth[1];

    update();
  }

  @override
  Future<void> biometricsLogin() async {
    await checkAuthenticate();

    if (isLoading || !showBiometricsButton) return;
    bool authenticated = false;

    try {
      authenticated = await localAuth.authenticate(
        localizedReason: localeLang().biometricPromptReason,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      _canAuthenticate = false;
      update();
    }
    if (!authenticated) return;

    _isLoading = true;
    update();

    await dashController.getAllData();
    _isLoading = false;
    update();
    if (dashController.user != null) {
      Get.offAllNamed(AppRoute.home);
    } else {
      ShowMySnackBar.error(
        localeLang().somethingWentWrongPleaseLogInWithPassword,
      );
    }
  }

  @override
  Future<void> login() async {
    if (NetworkInfo.showSnackBarWhenNoInternet) return;

    if (!formKey.currentState!.validate()) return;
    _isLoading = true;
    update();
    final Status<UserModel> loginState = await repo.login(
      LoginRequestData(
        loginBy: 'phone', // email
        emailOrPhone: phone!.phoneNumber!,
        password: password,
      ),
    );
    handleResponseInController<UserModel>(
      status: loginState,
      onSuccess: (data) {
        TextInput.finishAutofillContext();
        if (data.isVerified) {
          Get.offAllNamed(AppRoute.home);
        } else {
          Get.toNamed(AppRoute.waiting);
        }
      },
    );

    _isLoading = false;
    update();
  }

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if ((phone?.parseNumber().trim() ?? '').isNotEmpty || password.isNotEmpty) {
      if (DateTime.now().difference(_back) < const Duration(seconds: 2)) {
        if (!AppInfo.isDebugMode) exit(0);
      }
      ShowMySnackBar.call(
        localeLang().pressAgainToExit,
        duration: const Duration(seconds: 2),
      );
      _back = DateTime.now();

      return;
    } else {
      print('Close app');
      if (!AppInfo.isDebugMode) exit(0);
    }
  }
}
