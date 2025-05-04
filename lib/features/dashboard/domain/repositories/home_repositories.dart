import '../../../../core/status/status.dart';

abstract class HomeRepositories {
  const HomeRepositories();

  Future<Status<void>> updateFCMTokenAndTopic(String token);
  Future<Status<void>> logout();
}
