import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../domain/repositories/add_new_code_repositories.dart';
import 'dashboard_controller.dart';

abstract class AddNewCodeController extends GetxController {
  AddNewCodeController();
  final TextEditingController textController = TextEditingController();

  bool get isLoading;

  @override
  void onClose();

  Future<void> scanCode();

  void onPopInvoked();
}

class AddNewCodeControllerImp extends AddNewCodeController {
  AddNewCodeControllerImp({
    required this.repo,
    required this.dashboardController,
  });
  final AddNewCodeRepositories repo;
  final DashboardController dashboardController;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  bool _isBack = false;

  @override
  void onClose() {
    super.onClose();
    textController.dispose();
  }

  @override
  Future<void> scanCode() async {
    _isLoading = true;
    update();

    await handleResponseInController<void>(
      status: await repo.scanCode(textController.text.trim()),
      onSuccess: (_) {
        dashboardController.getUserData();
        Get.offNamed(AppRoute.codeAddedScreen);
        ShowMySnackBar.success(localeLang(Get.context!).newCodeAddedSuccess);
      },
    );
    _isLoading = false;
    update();
  }

  @override
  void onPopInvoked() async {
    if (_isBack) return;
    if (textController.text.trim().isNotEmpty) {
      _isBack = await ShowMyDialog.back() == true;
      if (_isBack) Get.back();
    } else {
      Get.back();
    }
  }
}
