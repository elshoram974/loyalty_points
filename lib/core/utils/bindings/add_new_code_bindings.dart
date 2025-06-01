import 'package:get/get.dart';

import '../../../features/dashboard/data/datasources/add_new_code_remote_data_source.dart';
import '../../../features/dashboard/data/repositories/add_new_code_repositories_imp.dart';
import '../../../features/dashboard/domain/repositories/add_new_code_repositories.dart';
import '../../../features/dashboard/presentation/controller/add_new_code_controller.dart';
import '../services/api_services.dart';

class AddNewCodeBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<AddNewCodeRemoteDataSource>(
      AddNewCodeRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<AddNewCodeRepositories>(
      AddNewCodeRepositoriesImp(
        remoteDataSource: Get.find<AddNewCodeRemoteDataSource>(),
      ),
    );

    Get.put<AddNewCodeController>(
      AddNewCodeControllerImp(Get.find<AddNewCodeRepositories>()),
    );
  }
}
