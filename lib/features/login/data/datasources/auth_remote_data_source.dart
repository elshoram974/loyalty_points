import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../domain/entity/sign_up_body_data.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<({UserModel user, String token})> login({
    required String phone,
    required String password,
  });
  Future<({UserModel user, String token})> signUp(SignUpBodyData data);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  const AuthRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<({UserModel user, String token})> login({
    required String phone,
    required String password,
  }) async {
    final Map<String, dynamic> res = await apiServices.post(
      AppLinks.login,
      {
        AppString.phone: phone,
        AppString.password: password,
        // AppString.phone: AppInfo.isDebugMode ? '+2001210119384' : phone,
        // AppString.password: AppInfo.isDebugMode ? 'Rep@2468' : password,
      },
    );
    final String token = res['token'];
    log(res.toString());

    return (
      user: UserModel.empty(),
      token: token,
    );
  }

  @override
  Future<({String token, UserModel user})> signUp(SignUpBodyData data) async {
    final Map<String, dynamic> res =
        await apiServices.postWithFile(AppLinks.signUp, {
      AppString.name: data.fullName,
      AppString.email: data.email,
      AppString.password: data.password,
      AppString.passwordConfirmation: data.passwordConfirmation,
      AppString.country: data.address,
      AppString.type: data.accountType.type,
      AppString.phone: data.phone.phoneNumber,
      AppString.providerId: data.providerId,
    }, files: {
      AppString.attachments: data.attachments,
      AppString.image: [data.profile],
    });
    final String token = res['token'];
    log(res.toString());

    return (
      user: UserModel.fromMap(res['user']),
      token: token,
    );
  }
}
