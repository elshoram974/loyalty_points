import 'package:loyalty_points/features/auth/data/models/user_model.dart';
import 'package:loyalty_points/features/dashboard/domain/entity/points_entity.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../../../core/utils/models/pagination_model.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/repositories/dashboard_repositories.dart';
import '../datasources/dashboard_remote_data_source.dart';

class DashboardRepositoriesImp extends DashboardRepositories {
  const DashboardRepositoriesImp({
    required this.remoteDataSource,
    required this.authLocalDataSource,
  });
  final DashboardRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Future<Status<void>> updateFCMTokenAndTopic(String token) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.updateFCMTokenAndAddAllUsersTopic(token),
    );
  }

  @override
  Stream<Status<UserModel?>> getUserData() async* {
    yield Success<UserModel?>(authLocalDataSource.getCurrentUser());

    final Status<UserModel> status = await executeAndHandleErrors<UserModel>(
      remoteDataSource.getCurrentUser,
    );

    if (status is Success<UserModel>) authLocalDataSource.saveUser(status.data);

    yield status;
  }

  @override
  Future<Status<void>> logout() {
    return executeAndHandleErrors<void>(
      () async {
        await remoteDataSource.updateFCMTokenAndAddAllUsersTopic(null);
        await authLocalDataSource.logOut();
      },
    );
  }

  @override
  Future<Status<PaginationModel<PointsEntity>>> getPoints(int page) {
    return executeAndHandleErrors<PaginationModel<PointsEntity>>(
      () => remoteDataSource.getPoints(page),
    );
  }

  @override
  Future<Status<PaginationModel<OrderEntity>>> getOrders(int page) {
    return executeAndHandleErrors<PaginationModel<OrderEntity>>(
      () => remoteDataSource.getOrders(page),
    );
  }
}
