import 'package:loyalty_points/features/dashboard/domain/entity/update_pass_data.dart';

import '../../../../core/status/status.dart';
import '../entity/profile_body_data.dart';

abstract class EditProfileRepositories {
  const EditProfileRepositories();

  Future<Status<void>> updateProfile(ProfileBodyData data);

  Future<Status<void>> updatePassword(UpdatePasswordData data);
}
