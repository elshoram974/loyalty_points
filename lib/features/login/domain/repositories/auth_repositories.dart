import '../../../../core/status/status.dart';
import '../../data/models/user_model.dart';
import '../entity/login_request_data.dart';
import '../entity/sign_up_body_data.dart';

abstract class AuthRepositories {
  const AuthRepositories();

  Future<Status<UserModel>> login(LoginRequestData data);
  Future<Status<UserModel>> signUp(SignUpBodyData body);
}
