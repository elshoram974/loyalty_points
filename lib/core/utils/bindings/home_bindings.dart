import 'package:get/get.dart';

import '../../../features/dashboard/data/datasources/dashboard_remote_data_source.dart';
import '../../../features/dashboard/data/repositories/dashboard_repositories_imp.dart';
import '../../../features/dashboard/domain/repositories/dashboard_repositories.dart';
import '../../../features/dashboard/presentation/controller/dashboard_controller.dart';
import '../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../features/dashboard/presentation/controller/orders_controller.dart';
import '../../../features/dashboard/presentation/controller/points_controller.dart';
import '../services/api_services.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardRemoteDataSource>(
      DashboardRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<DashboardRepositories>(
      DashboardRepositoriesImp(
        remoteDataSource: Get.find<DashboardRemoteDataSource>(),
        authLocalDataSource: Get.find<AuthLocalDataSource>(),
      ),
    );

    Get.put<PointsController>(
      PointsControllerImp(Get.find<DashboardRepositories>()),
    );
    Get.put<OrdersController>(
      OrdersControllerImp(Get.find<DashboardRepositories>()),
    );
    Get.put<DashboardController>(
      DashboardControllerImp(repo: Get.find<DashboardRepositories>()),
    );
  }
}
