import 'package:get/get.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/helper/show_my_snack_bar.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_links.dart';

class VerificationOtpController extends GetxController {
  final RxBool _submitting = false.obs;
  bool get submitting => _submitting.value;

  String normalizeEgMobile(String input) {
    String v = input.trim();
    v = v.replaceAll(RegExp(r'\s+'), '');
    if (v.startsWith('+')) v = v.substring(1);
    if (RegExp(r'^01\d{9}$').hasMatch(v)) {
      v = '20${v.substring(1)}';
    } else if (RegExp(r'^0\d{10}$').hasMatch(v)) {
      v = '2$v';
    }
    v = v.replaceAll(RegExp(r'\D'), '');
    return v;
  }

  Future<void> confirmOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    final ctx = Get.context;
    if (ctx == null) return;

    final loc = localeLang(ctx);
    final String mobile = normalizeEgMobile(phoneNumber);
    final String code = otp.trim();

    if (mobile.isEmpty || code.isEmpty) {
      ShowMySnackBar.error(loc.uHaveToFillFields);
      return;
    }

    _submitting.value = true;
    try {
      final api = Get.find<APIServices>();

      final res = await api.post(
        AppLinks.checkCode, // '/api/auth/forgot/verify-otp'
        {
          'mobile': mobile,
          'otp': code,
        },
      );

      if (res is Map && (res['success'] == true)) {
        ShowMySnackBar.success(
          (res['message'] ?? loc.successfully).toString(),
        );

        final data = (res['data'] is Map) ? res['data'] as Map : const {};
        final int? userId =
            data['user_id'] is int ? data['user_id'] as int : null;
        final String serverMobile =
            data['mobile']?.toString().isNotEmpty == true
                ? data['mobile'].toString()
                : mobile;

        Get.toNamed(
          AppRoute.resetPassword,
          arguments: {
            'user_id': userId,
            'mobile': serverMobile,
            'otp': code,
            'verified': data['verified'] == true,
          },
        );
      } else {
        final String msg = (res is Map && res['message'] != null)
            ? res['message'].toString()
            : localeLang().somethingWentWrong;
        ShowMySnackBar.error(msg);
      }
    } catch (e) {
      ShowMySnackBar.error(localeLang().otpError);
    } finally {
      _submitting.value = false;
    }
  }
}
