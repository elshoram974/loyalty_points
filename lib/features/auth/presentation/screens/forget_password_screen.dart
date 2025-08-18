import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/default_field.dart';
import '../../domain/repositories/auth_repositories.dart';
import 'verification_otp_code_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? _e164Phone;
  bool _isLoading = false;

  String _sanitizePhone(String input) {
    return input.replaceAll(RegExp(r'[^0-9]'), '');
  }

  Future<void> _sendCode() async {
    if (!(formKey.currentState?.validate() ?? false)) return;
    formKey.currentState!.save();

    final raw = (_e164Phone ?? '').trim();        
    final mobile = _sanitizePhone(raw);             

    if (mobile.isEmpty || mobile.length < 10) {
      Get.snackbar(localeLang().error,localeLang().enterValidMobileNumber);
      return;
    }

    try {
      setState(() => _isLoading = true);

      await Get.find<AuthRepositories>().sendCode(mobile);

      Get.to(() => VerificationOtpCode(phoneNumber: mobile));
    } catch (e) {
      Get.snackbar(localeLang().error, e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).resetPassword,
          style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 150,
                horizontal: AppConst.paddingDefault,
              ),
              child: MyDefaultField(
                controller: null,        
                isPhoneNumber: true,            
                keyboardType: TextInputType.phone,
                fillColor: Colors.white,
                filled: true,
                hintText: localeLang(context).enterYourMobileNumber,
                onPhoneInputChanged: (p) => _e164Phone = p.phoneNumber, 
                onPhoneInputSaved:    (p) => _e164Phone = p.phoneNumber, 
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                minimumSize: const Size(350, 50),
                backgroundColor: context.theme.primaryColor,
              ),
              onPressed: _isLoading ? null : _sendCode,
              child: _isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(localeLang(context).sendCode),
            ),
          ],
        ),
      ),
    );
  }
}
