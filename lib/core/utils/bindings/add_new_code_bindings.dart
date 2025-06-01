import 'package:get/get.dart';

import '../../../features/dashboard/data/datasources/add_new_code_remote_data_source.dart';
import '../../../features/dashboard/presentation/controller/add_new_code_controller.dart';
import '../services/api_services.dart';

class AddNewCodeBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<AddNewCodeRemoteDataSource>(
      AddNewCodeRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<AddNewCodeController>(AddNewCodeControllerImp());
  }
}
