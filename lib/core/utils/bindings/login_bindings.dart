import 'package:get/get.dart';

import '../../../features/auth/domain/repositories/auth_repositories.dart';
import '../../../features/auth/presentation/controller/login_controller.dart';
import '../../../features/dashboard/presentation/controller/dashboard_controller.dart';
import '../services/api_services.dart';

class LoginBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<LoginController>(
      LoginControllerImp(
        repo: Get.find<AuthRepositories>(),
        apiServices: Get.find<APIServices>(),
        dashController: Get.find<DashboardController>(),
      ),
    );
  }
}
