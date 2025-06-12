import 'package:get/get.dart';

import '../../../features/dashboard/domain/repositories/edit_profile_repositories.dart';
import '../../../features/dashboard/presentation/controller/dashboard_controller.dart';
import '../../../features/dashboard/presentation/controller/edit_profile_controller.dart';

class UpdateProfileBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<UpdateProfileController>(
      UpdateProfileControllerImp(
        repo: Get.find<EditProfileRepositories>(),
        dashboardController: Get.find<DashboardController>(),
      ),
    );
  }
}
