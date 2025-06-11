import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/entity/points_entity.dart';

abstract class DashboardRemoteDataSource {
  const DashboardRemoteDataSource();
  Future<void> updateFCMTokenAndAddAllUsersTopic(String? fcmToken);
  Future<UserModel> getCurrentUser();
  Future<List<PointsEntity>> getPoints(int page);
  Future<List<OrderEntity>> getOrders(int page);
}

class DashboardRemoteDataSourceImp extends DashboardRemoteDataSource {
  const DashboardRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<void> updateFCMTokenAndAddAllUsersTopic(String? fcmToken) async {
    if (fcmToken == null) {
      await Future.wait(
        [
          fcm.unsubscribeFromTopic(AppString.allUsers),
          apiServices.post(AppLinks.updateFCMToken, null),
        ],
      );
    } else {
      await Future.wait(
        [
          fcm.subscribeToTopic(AppString.allUsers),
          apiServices.post(
            AppLinks.updateFCMToken,
            {AppString.fcmToken: fcmToken},
          ),
        ],
      );
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final Map<String, dynamic> res = await apiServices.get(AppLinks.user);
    log(res.toString());

    return UserModel.fromMap(res);
  }

  @override
  Future<List<PointsEntity>> getPoints(int page) async {
    final Map<String, dynamic> res = await apiServices.get(
      AppLinks.pointsHistory,
    );
    log(res.toString());
    return [];
  }

  @override
  Future<List<OrderEntity>> getOrders(int page) async {
    final Map<String, dynamic> res = await apiServices.get(
      AppLinks.ordersHistory,
    );
    log(res.toString());
    return [];
  }
}
