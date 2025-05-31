import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/types/payment_methods.dart';

abstract class CheckoutController extends GetxController {
  CheckoutController();
  bool get isLoading;

  int get selectedPaymentIndex;

  PaymentMethod get payment;

  void setPayment(int newIndex);

  void setPhoneNumber(PhoneNumber phone);

  Future<void> makeRedeem();

  void onPopInvoked();
}

class CheckoutControllerImp extends CheckoutController {
  CheckoutControllerImp();

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  int _selectedPaymentIndex = 0;
  @override
  int get selectedPaymentIndex => _selectedPaymentIndex;

  @override
  PaymentMethod get payment => PaymentMethod.values[_selectedPaymentIndex];

  PhoneNumber? _phoneNumber;

  @override
  void setPayment(int newIndex) {
    _selectedPaymentIndex = newIndex;
    update();
  }

  @override
  void setPhoneNumber(PhoneNumber phone) => _phoneNumber = phone;

  bool _isBack = false;
  @override
  void onPopInvoked() async {
    if (_isBack || _isLoading) return;
    if (_phoneNumber?.phoneNumber?.trim().isNotEmpty == true) {
      _isBack = await ShowMyDialog.back() == true;
      if (_isBack) Get.back();
    } else {
      Get.back();
    }
  }

  @override
  Future<void> makeRedeem() async {
    _isLoading = true;
    update();
    _isLoading = false;
    update();
    Get.offNamed(AppRoute.successRedeemScreen);
  }
}
