import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/types/payment_methods.dart';
import '../../domain/repositories/redeem_repositories.dart';

abstract class RedeemController extends GetxController {
  RedeemController();
  final GlobalKey<FormFieldState> fieldKey = GlobalKey<FormFieldState>();

  bool get isLoading;

  int get selectedPaymentIndex;

  PaymentMethod get payment;

  PhoneNumber? get phone;

  void setPayment(int newIndex);

  void setPhoneNumber(PhoneNumber phone);

  Future<void> makeRedeem(int points);

  void onPopInvoked();
}

class RedeemControllerImp extends RedeemController {
  RedeemControllerImp(this.repo);
  final RedeemRepositories repo;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  int _selectedPaymentIndex = 0;
  @override
  int get selectedPaymentIndex => _selectedPaymentIndex;

  @override
  PaymentMethod get payment => PaymentMethod.values[_selectedPaymentIndex];

  PhoneNumber? _phone;
  @override
  PhoneNumber? get phone => _phone;

  @override
  void setPayment(int newIndex) {
    _selectedPaymentIndex = newIndex;
    update();
  }

  @override
  void setPhoneNumber(PhoneNumber phone) => _phone = phone;

  bool _isBack = false;
  @override
  void onPopInvoked() async {
    if (_isBack || _isLoading) return;
    if (_phone?.phoneNumber?.trim().isNotEmpty == true) {
      _isBack = await ShowMyDialog.back() == true;
      if (_isBack) Get.back();
    } else {
      Get.back();
    }
  }

  @override
  Future<void> makeRedeem(int points) async {
    if (!fieldKey.currentState!.validate()) return;
    _isLoading = true;
    update();
    _isLoading = false;
    update();
    Get.offNamed(AppRoute.successRedeemScreen);
  }
}
