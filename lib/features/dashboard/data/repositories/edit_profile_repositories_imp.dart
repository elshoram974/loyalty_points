import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../domain/entity/profile_body_data.dart';
import '../../domain/entity/update_pass_data.dart';
import '../../domain/repositories/edit_profile_repositories.dart';
import '../datasources/edit_profile_data_source.dart';

class EditProfileRepositoriesImp extends EditProfileRepositories {
  const EditProfileRepositoriesImp({required this.remoteDataSource});
  final EditProfileRemoteDataSource remoteDataSource;

  @override
  Future<Status<void>> updateProfile(ProfileBodyData data) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.updateProfile(data),
    );
  }
  @override
  Future<Status<void>> updatePassword(UpdatePasswordData data) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.updatePassword(data),
    );
  }
}
