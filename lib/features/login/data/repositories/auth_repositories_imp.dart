import 'package:loyalty_points/features/login/domain/entity/sign_up_body_data.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../domain/entity/login_request_data.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoriesImp extends AuthRepositories {
  const AuthRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  @override
  Future<Status<UserModel>> login(LoginRequestData data) {
    return executeAndHandleErrors<UserModel>(
      () async {
        final ({UserModel user, String token}) res = await remoteDataSource.login(data);
        await Future.wait(
          [
            localDataSource.saveUser(res.user),
            localDataSource.saveToken(res.token),
          ],
        );
        return res.user;
      },
    );
  }

  @override
  Future<Status<UserModel>> signUp(SignUpBodyData body) {
    return executeAndHandleErrors<UserModel>(
      () async {
        final ({UserModel user, String token}) res = await remoteDataSource.signUp(body);
        await Future.wait(
          [
            localDataSource.saveUser(res.user),
            localDataSource.saveToken(res.token),
          ],
        );
        return res.user;
      },
    );
  }
}
