import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/helper/network_helper.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/entity/profile_body_data.dart';
import '../../domain/repositories/edit_profile_repositories.dart';
import 'dashboard_controller.dart';

abstract class UpdateProfileController extends GetxController {
  bool get isLoading;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';

  XFile? profile;

  Future<void> updateProfile();

  void onPopInvoked(bool isPopped);
}

class UpdateProfileControllerImp extends UpdateProfileController {
  final EditProfileRepositories repo;
  final DashboardController dashboardController;
  UpdateProfileControllerImp({
    required this.repo,
    required this.dashboardController,
  });

  @override
  void onInit() {
    fullName = user?.name ?? '';
    email = user?.email ?? '';
    super.onInit();
  }

  UserModel? get user => dashboardController.user;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  Future<void> updateProfile() async {
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
    final Status<void> updateProfileState = await repo.updateProfile(
      ProfileBodyData(
        fullName: fullName,
        profile: profile,
        email: email,
      ),
    );
    handleResponseInController<void>(
      status: updateProfileState,
      onSuccess: (data) async {
        TextInput.finishAutofillContext();
        await dashboardController.getUserData();
        Get.back();
        ShowMySnackBar.success(localeLang(Get.context!).profileUpdatedSuccess);
      },
    );

    _isLoading = false;
    update();
  }

  bool _isBack = false;
  @override
  void onPopInvoked(bool isPopped) async {
    if (isPopped) return;
    if (fullName != user?.name ||
        email != user?.email.toLowerCase() ||
        profile != null) {
      _isBack = await ShowMyDialog.back() == true;
      if (_isBack) Get.back();
    } else {
      Get.back();
    }
  }
}
