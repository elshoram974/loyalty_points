import 'package:get/get.dart';

import '../../../features/auth/domain/repositories/auth_repositories.dart';
import '../../../features/auth/presentation/controller/set_new_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetNewPasswordControllerImp>(
      () => SetNewPasswordControllerImp(Get.find<AuthRepositories>()),
      fenix: true,
    );
  }
}