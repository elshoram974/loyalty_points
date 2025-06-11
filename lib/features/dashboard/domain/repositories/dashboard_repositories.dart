import '../../../../core/status/status.dart';
import '../../../auth/data/models/user_model.dart';
import '../entity/points_entity.dart';

abstract class DashboardRepositories {
  const DashboardRepositories();

  Future<Status<void>> updateFCMTokenAndTopic(String token);

  Stream<Status<UserModel?>> getUserData();

  Future<Status<void>> logout();

  Future<Status<List<PointsEntity>>> getPoints(int page);
}
