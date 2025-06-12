import 'package:get/get.dart';

import '../../../features/dashboard/data/datasources/edit_profile_data_source.dart';
import '../../../features/dashboard/data/repositories/edit_profile_repositories_imp.dart';
import '../../../features/dashboard/domain/repositories/edit_profile_repositories.dart';
import '../services/api_services.dart';

class ProfileBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<EditProfileRemoteDataSource>(
      EditProfileRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<EditProfileRepositories>(
      EditProfileRepositoriesImp(
          remoteDataSource: Get.find<EditProfileRemoteDataSource>()),
    );
  }
}
