import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/functions/app_validate.dart';
import '../../controller/sign_up_controller.dart';
import '../auth_field.dart';
import '../password_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return AutofillGroup(
          child: Column(
            spacing: AppConst.paddingDefault,
            children: [
              AuthField(
                isRequired: true,
                readOnly: controller.isLoading,
                onChanged: (v) => controller.fullName = v.trim(),
                label: localeLang(context).fullName,
                suffixIconData: Icons.person,
                textCapitalization: TextCapitalization.words,
                autofillHints: const [AutofillHints.name],
                hintText: localeLang(context).enterYourFullName,
                validator: (val) =>
                    AppValidator.auth(val?.trim(), 3, 100, FieldType.name),
              ),
              // AuthField(
              //   isRequired:false,
              //   readOnly: controller.isLoading,
              //   onChanged: (v) => controller.email = v.trim().toLowerCase(),
              //   label: localeLang(context).email,
              //   textCapitalization: TextCapitalization.none,
              //   suffixIconData: Icons.mail_rounded,
              //   autofillHints: const [AutofillHints.email],
              //   hintText: localeLang(context).enterYourEmailAddress,
              //   validator: (val) => AppValidator.auth(
              //       val?.trim().toLowerCase(), 0, 100, FieldType.email),
              // ),
              AuthField(
                isRequired: true,
                readOnly: controller.isLoading,
                isPhoneNumber: true,
                onPhoneInputChanged: (v) => controller.phone = v,
                label: localeLang(context).mobileNumber,
                hintText: localeLang(context).enterYourMobileNumber,
                autofillHints: const [
                  AutofillHints.telephoneNumber,
                  AutofillHints.telephoneNumberDevice,
                ],
              ),
              PasswordField(
                isNewPass: true,
                readOnly: controller.isLoading,
                label: localeLang(context).password,
                textInputAction: TextInputAction.next,
                onChanged: (val) => {
                  controller.password = val,
                  controller.update(['confirm-password'])
                },
                autofillHints: const [AutofillHints.newPassword],
                hintText: localeLang(context).enterNewPassword,
              ),
              GetBuilder<SignUpController>(
                  id: 'confirm-password',
                  builder: (controller) {
                    return PasswordField(
                      readOnly: controller.isLoading,
                      label: localeLang(context).confirmPassword,
                      otherPass: controller.password,
                      autofillHints: const [AutofillHints.newPassword],
                      hintText: localeLang(context).enterTheSamePassword,
                      onChanged: (val) => controller.passwordConfirmation = val,
                    );
                  }),
              AuthField(
                isRequired:false,
                readOnly: controller.isLoading,
                onChanged: (v) => controller.provider = v.trim(),
                label: localeLang(context).provider,
                textCapitalization: TextCapitalization.words,
                suffixIconData: Icons.storefront,
                hintText: localeLang(context).enterYourProviderName,
              ),
            ],
          ),
        );
      },
    );
  }
}
