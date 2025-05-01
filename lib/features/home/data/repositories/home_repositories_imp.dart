import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../../login/data/datasources/auth_local_data_source.dart';
import '../../domain/repositories/home_repositories.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoriesImp extends HomeRepositories {
  const HomeRepositoriesImp({
    required this.remoteDataSource,
    required this.authLocalDataSource,
  });
  final HomeRemoteDataSource remoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  @override
  Future<Status<void>> updateFCMTokenAndTopic(String token) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.updateFCMTokenAndAddAllUsersTopic(token),
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
