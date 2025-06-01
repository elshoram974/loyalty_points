import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helper/show_my_dialog.dart';

abstract class AddNewCodeController extends GetxController {
  AddNewCodeController();
  final TextEditingController textController = TextEditingController();

  bool get isLoading;

  Future<void> scanCode();

  void onPopInvoked();
}

class AddNewCodeControllerImp extends AddNewCodeController {
  AddNewCodeControllerImp();

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  bool _isBack = false;
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
}
