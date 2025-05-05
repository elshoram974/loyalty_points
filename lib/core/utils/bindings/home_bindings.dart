import 'package:get/get.dart';

import '../../../features/dashboard/data/datasources/home_remote_data_source.dart';
import '../../../features/dashboard/data/repositories/home_repositories_imp.dart';
import '../../../features/dashboard/domain/repositories/home_repositories.dart';
import '../../../features/dashboard/presentation/controller/home_controller.dart';
import '../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../services/api_services.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeRemoteDataSource>(
      HomeRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<HomeRepositories>(
      HomeRepositoriesImp(
        remoteDataSource: Get.find<HomeRemoteDataSource>(),
        authLocalDataSource: Get.find<AuthLocalDataSource>(),
      ),
    );
    Get.put<HomeController>(HomeControllerImp(Get.find<HomeRepositories>()));
  }
}
