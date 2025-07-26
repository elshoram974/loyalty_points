import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../../core/shared/custom_scaffold.dart';
import '../../../../../core/shared/default_field.dart';
import '../../../../dashboard/presentation/controller/send_otp_controller.dart';
import 'verification_otp_code.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _phoneController = TextEditingController();

  bool _validatePhone(BuildContext context) {
    final phone = _phoneController.text.trim();

    if (phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: context.theme.primaryColor,
            content: Text(
              localeLang(context).enterYourMobileNumber,
            )),
      );
      return false;
    }
    if (phone.length < 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: context.theme.primaryColor,
            content: Text(
              localeLang(context).enterValidMobileNumber,
            )),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final AuthController _authController = Get.put(AuthController());

    return CustomScaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        title: Text(localeLang(context).resetPassword),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 70, horizontal: AppConst.paddingDefault),
            child: MyDefaultField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              isPhoneNumber: true,
              fillColor: Colors.white,
              filled: true,
              hintText: localeLang(context).enterYourMobileNumber,
            ),
          ),
          FilledButton(
            onPressed: () async {
              if (_validatePhone(context)) {
                final phone = _phoneController.text.trim();
                final success =
                    await _authController.requestPasswordReset(phone);

                if (success) {
                  Get.to(() => const VerificationOtpCode());
                }
              }
            },
            child: Text(localeLang(context).sendCode),
          ),
        ],
      ),
    );
  }
}
