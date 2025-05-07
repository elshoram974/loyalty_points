import '../../../../core/status/status.dart';
import '../../../auth/data/models/user_model.dart';

abstract class HomeRepositories {
  const HomeRepositories();

  Future<Status<void>> updateFCMTokenAndTopic(String token);

  Stream<Status<UserModel?>> getUserData();

  Future<Status<void>> logout();
}
