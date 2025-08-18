import 'package:get/get.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/helper/network_helper.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../auth/domain/repositories/auth_repositories.dart';

abstract class SendOtpController extends GetxController {
  bool get isLoading;

  Future<void> sendCode(String mobile);
  Future<void> verifyCode({required String mobile, required String otp});
}

class SendOtpControllerImp extends SendOtpController {
  SendOtpControllerImp(this._repo);

  final AuthRepositories _repo;

  bool _isLoading = false;
  @override
  bool get isLoading => _isLoading;

  String? cachedMobile;  
  String _normalizeEgMobile(String input) {
    String v = input.trim().replaceAll(RegExp(r'\s+'), '');
    if (v.startsWith('+')) v = v.substring(1);
    if (RegExp(r'^01\\d{9}$').hasMatch(v)) {
      v = '20${v.substring(1)}';
    } else if (RegExp(r'^0\\d{10}$').hasMatch(v)) {
      v = '2$v';
    }
    return v.replaceAll(RegExp(r'\\D'), '');
  }

  @override
  Future<void> sendCode(String mobile) async {
    if (await NetworkInfo.showSnackBarWhenNoInternet) return;

    final String value = mobile.trim();
    if (value.isEmpty) {
      ShowMySnackBar.error(localeLang(Get.context!).uHaveToFillFields);
      return;
    }

    final String normalized = _normalizeEgMobile(value);
    _isLoading = true;
    update();

    final Status<void> state = await _repo.sendCode(normalized);

    handleResponseInController<void>(
      status: state,
      onSuccess: (_) {
        cachedMobile = normalized;  
        ShowMySnackBar.success(localeLang(Get.context!).successfully);
      },
    );

    _isLoading = false;
    update();
  }

  @override
  Future<void> verifyCode({required String mobile, required String otp}) async {
    if (await NetworkInfo.showSnackBarWhenNoInternet) return;

    final String m = _normalizeEgMobile(
      mobile.trim().isNotEmpty ? mobile.trim() : (cachedMobile ?? ''),
    );
    final String o = otp.trim();

    if (m.isEmpty || o.isEmpty) {
      ShowMySnackBar.error(localeLang(Get.context!).uHaveToFillFields);
      return;
    }

    _isLoading = true;
    update();
    final Status<void> state = await _repo.checkCode( otp);

    handleResponseInController<void>(
      status: state,
      onSuccess: (_) {
        ShowMySnackBar.success(localeLang(Get.context!).successfully);
        Get.toNamed(
          AppRoute.resetPassword,
          arguments: {
            'mobile': m,
            'otp': o,
            'verified': true,
          },
        );
      },
    );

    _isLoading = false;
    update();
  }
}
