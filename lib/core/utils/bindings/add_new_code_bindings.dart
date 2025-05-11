import 'package:get/get.dart';

import '../../../features/dashboard/presentation/controller/add_new_code_controller.dart';

class AddNewCodeBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<AddNewCodeController>(AddNewCodeControllerImp());
  }
}
