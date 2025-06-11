import '../../../../core/status/status.dart';
import '../../../../core/utils/models/pagination_model.dart';
import '../../../auth/data/models/user_model.dart';
import '../entity/order_entity.dart';
import '../entity/points_entity.dart';

abstract class DashboardRepositories {
  const DashboardRepositories();

  Future<Status<void>> updateFCMTokenAndTopic(String token);

  Stream<Status<UserModel?>> getUserData();

  Future<Status<void>> logout();

  Future<Status<PaginationModel<PointsEntity>>> getPoints(int page);

  Future<Status<PaginationModel<OrderEntity>>> getOrders(int page);
}
