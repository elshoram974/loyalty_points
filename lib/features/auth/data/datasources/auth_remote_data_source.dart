import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../domain/entity/login_request_data.dart';
import '../../domain/entity/sign_up_body_data.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<({UserModel user, String token})> login(LoginRequestData data);
    
  Future<({UserModel user, String token})> signUp(SignUpBodyData data);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  const AuthRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<({UserModel user, String token})> login(LoginRequestData data) async {
    final Map<String, dynamic> res = await apiServices.post(
      AppLinks.login,
      {
        AppString.emailOrPhone: data.emailOrPhone,
        AppString.password: data.password,
        AppString.loginBy: data.loginBy
      },
    );
    log(res.toString());

    return (
      user: UserModel.fromMap(res['data']['user']),
      token: res['data']['token'] as String,
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
      if(data.provider?.trim().isNotEmpty == true) AppString.providerName: data.provider,
    }, files: {
      AppString.attachments: data.attachments,
      AppString.image: [data.profile],
    });
    log(res.toString());

    return (
      user: UserModel.fromMap(res['data']['user']),
      token: res['data']['token'] as String,
    );
  }
}
