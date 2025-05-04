import 'package:get/get.dart';

import '../../../features/auth/domain/repositories/auth_repositories.dart';
import '../../../features/auth/presentation/controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LoginController>(
      LoginControllerImp(Get.find<AuthRepositories>()),
    );
  }
}
