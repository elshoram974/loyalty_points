import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/functions/app_validate.dart';
import '../../../dashboard/presentation/controller/verifaction_otp_controller.dart';
import '../widgets/login/count_down_widget.dart';

// Controller

class VerificationOtpCode extends StatefulWidget {
  final String phoneNumber;

  const VerificationOtpCode({super.key, required this.phoneNumber});

  @override
  State<VerificationOtpCode> createState() => _VerificationOtpCodeState();
}

class _VerificationOtpCodeState extends State<VerificationOtpCode> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  //ntb
  final VerificationOtpController _controller =
      Get.put(VerificationOtpController(), permanent: false);

  String _otpCode = "";

  void _onConfirmPressed() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    _controller.confirmOtp(
      phoneNumber: widget.phoneNumber,
      otp: _otpCode,
    );
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localeLang().weHaveSendCodeTo,
                    style:const TextStyle(
                      fontSize: AppConst.paddingDefault,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  Text(
               ' ${widget.phoneNumber}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: AppConst.paddingMedium,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ],
              ),
             const SizedBox(height: 30,),
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
                        color: context.theme.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (code) => setState(() => _otpCode = code),
                  onCompleted: (code) {
                    _otpCode = code;
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
               CountDownWidget(mobile: widget.phoneNumber),
              const SizedBox(height: 20),
              Obx(() {
                final submitting = _controller.submitting;
                return SizedBox(
                  width: 300,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(350, 50),
                      backgroundColor: context.theme.primaryColor,
                    ),
                    onPressed: submitting ? null : _onConfirmPressed,
                    child: submitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(localeLang(context).confirm),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
