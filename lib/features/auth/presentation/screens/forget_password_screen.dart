import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/default_field.dart';
import 'verification_otp_code_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // final AuthController _authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).resetPassword,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
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
              style: FilledButton.styleFrom(
                minimumSize: const Size(350, 50),
                backgroundColor: context.theme.primaryColor,
              ),
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  final phone = _phoneController.text.trim();
                  // final success =
                  //     await _authController.requestPasswordReset(phone);

                  // if (success) {
                    Get.to(() => VerificationOtpCode(
                          phoneNumber: phone,
                        ));
                  // }
                }
              },
              child: Text(localeLang(context).sendCode),
            ),
          ],
        ),
      ),
    );
  }
}
