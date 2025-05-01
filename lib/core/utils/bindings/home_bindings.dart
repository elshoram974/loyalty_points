import 'package:get/get.dart';

import '../../../features/home/presentation/controller/home_controller.dart';
import '../../../features/login/domain/repositories/auth_repositories.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeControllerImp(
         Get.find<AuthRepositories>(),
        // user: Get.find<AuthLocalDataSource>().getCurrentUser(),
      ),
    );
  }
}
