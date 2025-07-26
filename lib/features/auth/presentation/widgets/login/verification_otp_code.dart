import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../../core/shared/custom_scaffold.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import 'count_down_widget.dart';
import 'reset_password.dart';

class VerificationOtpCode extends StatefulWidget {
  final String phoneNumber;

  const VerificationOtpCode({super.key, required this.phoneNumber});

  @override
  State<VerificationOtpCode> createState() => _VerificationOtpCodeState();
}

class _VerificationOtpCodeState extends State<VerificationOtpCode> {
  String _otpCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 55,
      textStyle: const TextStyle(fontSize: 20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: context.theme.primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return CustomScaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
        title: Text(localeLang(context).resetPassword),
      ),
      body: Form(
        key: formKey,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('رقم الموبايل هو: ${widget.phoneNumber}'),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border:
                        Border.all(color: context.theme.primaryColor, width: 2),
                  ),
                ),
                onChanged: (code) {
                  setState(() {
                    _otpCode = code;
                  });
                },
                onCompleted: (code) {
                  _otpCode = code;
                  FocusScope.of(context).unfocus();
                },
              ),
              const CountDownWidget(),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: FilledButton(
                  onPressed: () {
                    if (_otpCode.length != 6) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: context.theme.primaryColor,
                          content:
                              Text(localeLang(context).pleaseWriteYourCode),
                        ),
                      );
                      return;
                    }
                    print("OTP: $_otpCode");
                    Get.to(() => const ResetPasswordFields());
                  },
                  child: Text(localeLang(context).confirm),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
