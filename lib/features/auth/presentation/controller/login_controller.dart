import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:local_auth/local_auth.dart';
import 'package:timer_count_down/timer_controller.dart';

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
  final CountdownController timerController = CountdownController();

  PhoneNumber? phone;
  String password = '';

  bool get showBiometricsButton;
  bool get canUseBiometrics;
  bool get hasFaceId;

  void changeUsingBiometrics(bool value);
  Future<void> checkAuthenticate();

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

  late bool _canUseBiometrics = showBiometricsButton;
  @override
  bool get canUseBiometrics => _canUseBiometrics;

  late bool _hasFaceId = Platform.isIOS;
  @override
  bool get hasFaceId => _hasFaceId;

  @override
  void onReady() {
    if (AppInfo.useLocalAuth) biometricsLogin();
    super.onReady();
  }

  @override
  void changeUsingBiometrics(bool value) {
    _canUseBiometrics = value;
    update();
  }

  @override
  Future<void> checkAuthenticate() async {
    final List auth = await Future.wait([
      localAuth.isDeviceSupported(), // 0
      localAuth.canCheckBiometrics, // 1
      localAuth.getAvailableBiometrics(), // 2
    ]);
    _canAuthenticate = (auth[0] as bool) && (auth[1] as bool);
    _hasFaceId = (auth[2] as List<BiometricType>).contains(BiometricType.face);
    _canUseBiometrics = showBiometricsButton;

    update();
  }

  @override
  Future<void> biometricsLogin() async {
    await checkAuthenticate();

    if (isLoading || !showBiometricsButton || !_canUseBiometrics) return;
    bool authenticated = false;

    try {
      authenticated = await localAuth.authenticate(
        localizedReason: localeLang().biometricPromptReason,
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        ),
      );
    } catch (e) {
      if (AppInfo.isDebugMode) print(e.toString());
      if (e is PlatformException) {
        ShowMySnackBar.error(e.message ?? e.code);
        if (e.code == 'LockedOut') {
          if (timerController.isCompleted == true) {
            timerController.restart();
          } else {
            timerController.start();
          }
          changeUsingBiometrics(false);
        }
      }
    }
    // localAuth.stopAuthentication();
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
    throw "wsafsfasfa";
    if (!formKey.currentState!.validate()) return;
    if (await NetworkInfo.showSnackBarWhenNoInternet) return;
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
