import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/helper/network_helper.dart';

import '../../../auth/domain/repositories/auth_repositories.dart';
import '../../../dashboard/domain/entity/set_new_password_data.dart';
import '../../../dashboard/presentation/controller/send_otp_controller.dart';


abstract class SetNewPasswordController extends GetxController {
  bool get isLoading;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String newPassword = '';
  String confirmPassword = '';

  String mobile = '';
  String otp = '';

  final TextEditingController passwordCtrl = TextEditingController();
  final TextEditingController confirmCtrl = TextEditingController();

  Future<void> SetNewPassword();

  void onPopInvoked(bool isPopped);
}

class SetNewPasswordControllerImp extends SetNewPasswordController {
  final AuthRepositories repo;
  SetNewPasswordControllerImp(this.repo);

  bool _isLoading = false;
  @override
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();

    final args = Get.arguments;
    String? _argMobile = (args is Map) ? args['mobile'] as String? : null;
    String? _argOtp    = (args is Map) ? args['otp'] as String?    : null;

    if ((_argMobile == null || _argMobile.isEmpty) || (_argOtp == null || _argOtp.isEmpty)) {
      if (Get.isRegistered<SendOtpControllerImp>()) {
        final s = Get.find<SendOtpControllerImp>();
        _argMobile ??= s.cachedMobile;
      }
    }
    mobile = _argMobile ?? '';
    otp    = _argOtp ?? '';
    if (mobile.isEmpty || otp.isEmpty) {
      Future.microtask(() {
        ShowMySnackBar.call(
          localeLang().verficationStepIsrequired,
          backgroundColor: Get.theme.colorScheme.error,
        );
        if (Get.isOverlaysOpen == false && Get.key.currentState?.canPop() == true) {
          Get.back();
        }
      });
    }
  }
  @override
  Future<void> SetNewPassword() async {
    if (await NetworkInfo.showSnackBarWhenNoInternet) return;

    final String passFromForm = newPassword.trim();
    final String confFromForm = confirmPassword.trim();
    final String passFromCtrl = passwordCtrl.text.trim();
    final String confFromCtrl = confirmCtrl.text.trim();

    final String pass = passFromForm.isNotEmpty ? passFromForm : passFromCtrl;
    final String conf = confFromForm.isNotEmpty ? confFromForm : confFromCtrl;
    if (formKey.currentState != null) {
      if (!formKey.currentState!.validate()) {
        ShowMySnackBar.call(
          localeLang(Get.context!).uHaveToFillFields,
          backgroundColor: Get.theme.colorScheme.error,
        );
        return;
      }
    } else {
      if (mobile.isEmpty || otp.isEmpty) {
        ShowMySnackBar.call(
          localeLang().mobileOrOtpMissing,
          backgroundColor: Get.theme.colorScheme.error,
        );
        return;
      }
      if (pass.isEmpty || conf.isEmpty) {
        ShowMySnackBar.call(
          localeLang().enterPasswordAndConfirmation,
          backgroundColor: Get.theme.colorScheme.error,
        );
        return;
      }
      if (pass != conf) {
        ShowMySnackBar.call(
          localeLang().passwordsDoNotMatch,
          backgroundColor: Get.theme.colorScheme.error,
        );
        return;
      }
    }

    _isLoading = true;
    update();
    final Status<void> state = await repo.createNewPass(
      SetNewPasswordData(
        mobile: mobile,
        otp: otp,
        password: pass,
        confirmPassword: conf,
      ),
    );

    handleResponseInController<void>(
      status: state,
      onSuccess: (_) {
        TextInput.finishAutofillContext();
        Get.offAllNamed(AppRoute.login);
        ShowMySnackBar.success(localeLang(Get.context!).passwordChangedSuccess);
      },
    );

    _isLoading = false;
    update();
  }

  @override
  void onClose() {
    passwordCtrl.dispose();
    confirmCtrl.dispose();
    super.onClose();
  }

  @override
  void onPopInvoked(bool isPopped) {
    if (isPopped) return;
  }
}
