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

abstract class SetNewPasswordController extends GetxController {
  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String newPassword = '';
  String confirmPassword = '';

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
  Future<void> SetNewPassword() async {
    if (await NetworkInfo.showSnackBarWhenNoInternet) return;

    if (!formKey.currentState!.validate()) {
      ShowMySnackBar.call(
        localeLang(Get.context!).uHaveToFillFields,
        backgroundColor: Get.theme.colorScheme.error,
      );
      return;
    }
    _isLoading = true;
    update();
    final Status<void> SetNewPasswordState = await repo.createNewPass(
      SetNewPasswordData(
        confirmPassword: confirmPassword,
        newPassword: newPassword,
      ),
    );
    handleResponseInController<void>(
      status: SetNewPasswordState,
      onSuccess: (data) {
        TextInput.finishAutofillContext();
        Get.toNamed(AppRoute.login);
        ShowMySnackBar.success(localeLang(Get.context!).passwordChangedSuccess);
      },
    );

    _isLoading = false;
    update();
  }
  @override
  void onPopInvoked(bool isPopped) async {
    if (isPopped) return;
 
  }
}
