import '../../../../core/status/status.dart';
import '../../../dashboard/domain/entity/set_new_password_data.dart';
import '../../data/models/address_model.dart';
import '../../data/models/user_model.dart';
import '../entity/login_request_data.dart';
import '../entity/sign_up_body_data.dart';

abstract class AuthRepositories {
  const AuthRepositories();

  Future<Status<UserModel>> login(LoginRequestData data);
  Future<Status<void>> signUp(SignUpBodyData body);
  Future<Status<void>> sendCode(String phone);
  Future<Status<void>> checkCode(String code);
  Future<Status<void>> createNewPass(SetNewPasswordData newPass);

  Future<Status<List<AddressModel>>> getCountries();
  Future<Status<List<AddressModel>>> getGovernorates(int countryId);
  Future<Status<List<AddressModel>>> getCities(int governorateId);
}
