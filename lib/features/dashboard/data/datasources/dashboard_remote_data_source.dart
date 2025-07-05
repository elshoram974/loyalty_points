import '../../../../app_info.dart';
import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/models/pagination_model.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/entity/points_entity.dart';
import '../model/order_model.dart';
import '../model/points_model.dart';

abstract class DashboardRemoteDataSource {
  const DashboardRemoteDataSource();
  Future<void> updateFCMTokenAndAddAllUsersTopic(String? fcmToken);
  Future<UserModel> getCurrentUser();
  Future<PaginationModel<PointsEntity>> getPoints(int page);
  Future<PaginationModel<OrderEntity>> getOrders(int page);
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

    return UserModel.fromMap(res);
  }

  @override
  Future<PaginationModel<PointsEntity>> getPoints(int page) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.pointsHistory}?page=$page&limit=${AppInfo.paginationLimit}",
    );
    return PaginationModel<PointsModel>.fromMap(res, PointsModel.fromMap);
  }

  @override
  Future<PaginationModel<OrderEntity>> getOrders(int page) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.ordersHistory}?page=$page&limit=${AppInfo.paginationLimit}",
    );
    return PaginationModel<OrderEntity>.fromMap(res, OrderModel.fromMap);
  }
}
