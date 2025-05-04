import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../controller/login_controller.dart';
import '../auth_field.dart';
import '../password_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return AutofillGroup(
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                AuthField(
                  readOnly: controller.isLoading,
                  isPhoneNumber: true,
                  onPhoneInputChanged: (v) => controller.phone = v,
                  label: localeLang(context).mobileNumber,
                  hintText: localeLang(context).enterYourMobileNumber,
                  autofillHints: const [AutofillHints.email],
                ),
                const SizedBox(height: 2 * AppConst.paddingDefault),
                PasswordField(
                  readOnly: controller.isLoading,
                  label: localeLang(context).password,
                  hintText: localeLang(context).enterThePassword,
                  onFieldSubmitted: (_) => controller.login(),
                  onChanged: (val) => controller.password = val,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
