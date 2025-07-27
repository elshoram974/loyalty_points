import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/functions/app_validate.dart';
import '../widgets/login/count_down_widget.dart';
import 'reset_new_password_screen.dart';

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
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('رقم الموبايل هو: ${widget.phoneNumber}'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Pinput(
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  defaultPinTheme: defaultPinTheme,
                  validator: (val) => AppValidator.otp(val),
                  focusedPinTheme: defaultPinTheme.copyWith(
                    decoration: defaultPinTheme.decoration!.copyWith(
                      border: Border.all(
                          color: context.theme.primaryColor, width: 2),
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
              ),
              const CountDownWidget(),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: context.theme.primaryColor,
                  ),
                  onPressed: () {
                    final isValid = formKey.currentState!.validate();
                    if (isValid) {
                      print("OTP: $_otpCode");
                      Get.to(() => const ResetPasswordFields());
                    } else {
                      
                    }
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
