import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../domain/entities/redeem_entity.dart';

abstract class RedeemRemoteDataSource {
  const RedeemRemoteDataSource();
  Future<void> createRedeem(RedeemEntity data);
}

class RedeemRemoteDataSourceImp extends RedeemRemoteDataSource {
  const RedeemRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<void> createRedeem(RedeemEntity data) async {
    final Map<String, dynamic> res = await apiServices.post(
      AppLinks.createRedeem,
      data.toJson(),
    );
    log(res.toString());
  }
}
