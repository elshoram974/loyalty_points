import '../../../../core/status/status.dart';

abstract class AddNewCodeRepositories {
  const AddNewCodeRepositories();

  Future<Status<void>> scanCode(String code);
}
