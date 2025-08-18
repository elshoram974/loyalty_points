import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../dashboard/domain/entity/set_new_password_data.dart';
import '../../domain/entity/login_request_data.dart';
import '../../domain/entity/sign_up_body_data.dart';
import '../models/address_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<({UserModel user, String token})> login(LoginRequestData data);

  Future<({UserModel user, String token})> signUp(SignUpBodyData data);

  Future<List<AddressModel>> getCountries();
  Future<List<AddressModel>> getGovernorates(int countryId);
  Future<List<AddressModel>> getCities(int governorateId);

  Future<void> sendCode(String mobile);

  Future<void> checkCode({required String mobile, required String otp});

  Future<void> createNewPass(SetNewPasswordData newPass);
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
        AppString.loginBy: data.loginBy,
      },
    );

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
      AppString.addressId: data.areaId,
      AppString.type: data.accountType.type,
      AppString.phone: data.phone.phoneNumber,
      AppString.latitude: data.position.latitude,
      AppString.longitude: data.position.longitude,
      if (data.provider?.trim().isNotEmpty == true)
        AppString.providerName: data.provider,
    }, files: {
      AppString.attachments: data.attachments,
      AppString.image: [data.profile],
    });

    return (
      user: UserModel.fromMap(res['data']['user']),
      token: res['data']['token'] as String,
    );
  }

  @override
  Future<List<AddressModel>> getCountries() async {
    final Map<String, dynamic> res = await apiServices.get(
      AppLinks.countriesList,
    );
    return AddressModel.fromMaps(res['data']);
  }

  @override
  Future<List<AddressModel>> getGovernorates(int countryId) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.governoratesList}/$countryId",
    );
    return AddressModel.fromMaps(res['data']);
  }

  @override
  Future<List<AddressModel>> getCities(int governorateId) async {
    final Map<String, dynamic> res = await apiServices.get(
      "${AppLinks.areasList}/$governorateId",
    );
    return AddressModel.fromMaps(res['data']);
  }

  @override
  Future<void> sendCode(String mobile) async {
    await apiServices.post(
      AppLinks.sendCode,
      {
        'mobile': mobile,
      },
    );
  }

  @override
  Future<void> checkCode({required String mobile, required String otp}) async {
    await apiServices.post(
      AppLinks.checkCode,
      {
        'mobile': mobile,
        'otp': otp,
      },
    );
  }

  @override
  Future<void> createNewPass(SetNewPasswordData newPass) async {
    await apiServices.post(
      AppLinks.newPassword,
      {
        'mobile': newPass.mobile,
        'otp': newPass.otp,
        AppString.password: newPass.password,
      
      },
    );
  }
}
