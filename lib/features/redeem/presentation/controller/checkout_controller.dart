import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/types/payment_methods.dart';

abstract class CheckoutController extends GetxController {
  CheckoutController();
  final TextEditingController textController = TextEditingController();

  bool get isLoading;

  int get selectedPaymentIndex;

  PaymentMethod get payment;

  Future<void> addNewCode();

  void onPopInvoked();
}

class CheckoutControllerImp extends CheckoutController {
  CheckoutControllerImp();

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  int get _selectedPaymentIndex => 0;
  @override
  int get selectedPaymentIndex => _selectedPaymentIndex;

  @override
  PaymentMethod get payment => PaymentMethod.values[_selectedPaymentIndex];

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
  Future<void> addNewCode() async {
    _isLoading = true;
    update();
    _isLoading = false;
    update();
  }
}
