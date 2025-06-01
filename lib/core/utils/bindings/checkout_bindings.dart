import 'package:get/get.dart';

import '../../../features/redeem/data/datasources/redeem_data_source.dart';
import '../../../features/redeem/data/repositories/redeem_repositories_imp.dart';
import '../../../features/redeem/domain/repositories/redeem_repositories.dart';
import '../../../features/redeem/presentation/controller/redeem_controller.dart';
import '../services/api_services.dart';

class CheckoutBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<RedeemRemoteDataSource>(
      RedeemRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<RedeemRepositories>(
      RedeemRepositoriesImp(
          remoteDataSource: Get.find<RedeemRemoteDataSource>()),
    );
    Get.put<RedeemController>(
      RedeemControllerImp(Get.find<RedeemRepositories>()),
    );
  }
}
