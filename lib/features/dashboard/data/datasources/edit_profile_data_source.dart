import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../domain/entity/profile_body_data.dart';

abstract class EditProfileRemoteDataSource {
  const EditProfileRemoteDataSource();

  Future<void> updateProfile(ProfileBodyData data);
}

class EditProfileRemoteDataSourceImp extends EditProfileRemoteDataSource {
  const EditProfileRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<void> updateProfile(ProfileBodyData data) async {
    await apiServices.postWithFile(
      AppLinks.updateProfile,
      {
        if (data.fullName != null) AppString.name: data.fullName,
        if (data.email != null) AppString.email: data.email,
      },
      files: {
        if (data.profile != null) AppString.image: [data.profile!],
      },
    );
  }
  // @override
  // Future<void> signUp(ProfileBodyData data) async {
  //   final Map<String, dynamic> res =
  //       await apiServices.postWithFile(AppLinks.signUp, {
  //     AppString.name: data.fullName,
  //     AppString.email: data.email,
  //     AppString.password: data.password,
  //     AppString.passwordConfirmation: data.passwordConfirmation,
  //     AppString.country: data.address,
  //     AppString.type: data.accountType.type,
  //     AppString.phone: data.phone.phoneNumber,
  //     if (data.provider?.trim().isNotEmpty == true)
  //       AppString.providerName: data.provider,
  //   }, files: {
  //     AppString.attachments: data.attachments,
  //     AppString.image: [data.profile],
  //   });
  //   log(res.toString());

  //   return (
  //     user: UserModel.fromMap(res['data']['user']),
  //     token: res['data']['token'] as String,
  //   );
  // }
}
