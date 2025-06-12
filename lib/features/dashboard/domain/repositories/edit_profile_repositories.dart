import '../../../../core/status/status.dart';
import '../entity/profile_body_data.dart';

abstract class EditProfileRepositories {
  const EditProfileRepositories();

  Future<Status<void>> updateProfile(ProfileBodyData data);
}
