import 'package:loyalty_points/features/auth/data/models/user_model.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../../auth/data/datasources/auth_local_data_source.dart';
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

    yield await executeAndHandleErrors<UserModel>(
      remoteDataSource.getCurrentUser,
    );
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
}
