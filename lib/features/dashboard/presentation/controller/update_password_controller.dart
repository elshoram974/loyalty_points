import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';

import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/helper/network_helper.dart';
import '../../domain/repositories/edit_profile_repositories.dart';

abstract class UpdatePasswordController extends GetxController {
  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  Future<void> updatePassword();

  void onPopInvoked(bool isPopped);
}

class UpdatePasswordControllerImp extends UpdatePasswordController {
  final EditProfileRepositories repo;
  UpdatePasswordControllerImp(this.repo);

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> updatePassword() async {
    if (NetworkInfo.showSnackBarWhenNoInternet) return;

    if (!formKey.currentState!.validate()) {
      ShowMySnackBar.call(
        localeLang(Get.context!).uHaveToFillFields,
        backgroundColor: Get.theme.colorScheme.error,
      );
      return;
    }
    _isLoading = true;
    update();

    // final Status<void> signUpState = await repo.updateProfile(
    //   UpdatePasswordData(
    //     oldPassword: oldPassword,
    //     newPassword: newPassword,
    //     newPasswordAgain: newPasswordAgain,
    //   ),
    // );
    // handleResponseInController<void>(
    //   status: signUpState,
    //   onSuccess: (data) async {
    //     TextInput.finishAutofillContext();
    //     Get.back();
    //   },
    // );

    _isLoading = false;
    update();
  }

  bool _isBack = false;
  @override
  void onPopInvoked(bool isPopped) async {
    if (isPopped) return;
    if (currentPassword.isNotEmpty ||
        newPassword.isNotEmpty ||
        confirmPassword.isNotEmpty) {
      _isBack = await ShowMyDialog.back() == true;
      if (_isBack) Get.back();
    } else {
      Get.back();
    }
  }
}
