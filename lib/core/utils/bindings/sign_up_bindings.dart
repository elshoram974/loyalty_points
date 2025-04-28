import 'package:get/get.dart';

import '../../../features/login/data/repositories/auth_repositories_imp.dart';
import '../../../features/login/presentation/controller/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<SignUpController>(
      SignUpControllerImp(Get.find<AuthRepositoriesImp>()),
    );
  }
}
