import 'package:get/get.dart';

import '../../../features/auth/domain/repositories/auth_repositories.dart';
import '../../../features/auth/presentation/controller/sign_up_controller.dart';

class SignUpBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<SignUpController>(
      SignUpControllerImp(Get.find<AuthRepositories>()),
    );
  }
}
