import 'package:get/get.dart';

import '../../../features/dashboard/domain/repositories/edit_profile_repositories.dart';
import '../../../features/dashboard/presentation/controller/update_password_controller.dart';

class UpdatePasswordBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<UpdatePasswordController>(
      UpdatePasswordControllerImp(Get.find<EditProfileRepositories>()),
    );
  }
}
