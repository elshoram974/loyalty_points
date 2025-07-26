import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../../core/shared/custom_scaffold.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import 'count_down_widget.dart';
import 'reset_password.dart';

class VerificationOtpCode extends StatefulWidget {
  const VerificationOtpCode({super.key});

  @override
  State<VerificationOtpCode> createState() => _VerificationOtpCodeState();
}

class _VerificationOtpCodeState extends State<VerificationOtpCode> {
  String _otpCode = "";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        title: Text(localeLang(context).resetPassword),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(
              focusedBorderColor: context.theme.primaryColor,
              showFieldAsBox: true,
              numberOfFields: 6,
              borderWidth: 2.0,
              borderColor: Colors.red,
              enabledBorderColor: const Color.fromARGB(255, 174, 166, 166),
              onCodeChanged: (String code) {
                setState(() {
                  _otpCode = code;
                });
                if (code.length == 6) {
                  FocusScope.of(context).unfocus();
                }
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                _otpCode = verificationCode;
              },
            ),
            const CountDownWidget(),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: FilledButton(
                onPressed: () {
                  if (_otpCode.length == 6) {
                    Get.to(()=> const  ResetPasswordFields());
                    // هنا تقدر تبعت الكود للسيرفر
                    print("OTP: $_otpCode");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: context.theme.primaryColor,
                        content: Text(localeLang(context).pleaseWriteYourCode),
                      ),
                    );
                  }
                },
                child: Text(localeLang(context).confirm),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
