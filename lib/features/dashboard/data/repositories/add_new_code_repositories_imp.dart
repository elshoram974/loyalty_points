import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../domain/repositories/add_new_code_repositories.dart';
import '../datasources/add_new_code_remote_data_source.dart';

class AddNewCodeRepositoriesImp extends AddNewCodeRepositories {
  const AddNewCodeRepositoriesImp({required this.remoteDataSource});
  final AddNewCodeRemoteDataSource remoteDataSource;

  @override
  Future<Status<void>> scanCode(String code) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.scanCode(code),
    );
  }
}
