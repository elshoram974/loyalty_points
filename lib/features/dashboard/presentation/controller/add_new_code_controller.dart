import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../domain/repositories/add_new_code_repositories.dart';

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
  AddNewCodeControllerImp(this.repo);
  final AddNewCodeRepositories repo;

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
