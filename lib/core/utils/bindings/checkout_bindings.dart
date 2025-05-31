import 'package:get/get.dart';

import '../../../features/redeem/presentation/controller/checkout_controller.dart';

class CheckoutBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<CheckoutController>(CheckoutControllerImp());
  }
}
