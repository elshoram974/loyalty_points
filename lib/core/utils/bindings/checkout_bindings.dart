import 'package:get/get.dart';

import '../../../features/redeem/data/datasources/redeem_data_source.dart';
import '../../../features/redeem/presentation/controller/redeem_controller.dart';
import '../services/api_services.dart';

class CheckoutBindings extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put<RedeemRemoteDataSource>(
      RedeemRemoteDataSourceImp(Get.find<APIServices>()),
    );
    Get.put<RedeemController>(RedeemControllerImp());
  }
}
