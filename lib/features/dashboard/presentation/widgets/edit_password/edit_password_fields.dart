import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

import '../../../../auth/presentation/widgets/password_field.dart';
import '../../controller/update_password_controller.dart';

class EditPasswordFields extends GetView<UpdatePasswordController> {
  const EditPasswordFields({super.key});
  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            PasswordField(
              isNewPass: false,
              label: localeLang(context).current_password,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.password],
              hintText: localeLang(context).current_password,
              onChanged: (val) => controller.currentPassword = val,
            ),
            const SizedBox(
              height: AppConst.paddingDefault,
            ),
            PasswordField(
              isNewPass: true,
              label: localeLang(context).password,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newPassword],
              hintText: localeLang(context).enterNewPassword,
              onChanged: (val) {
                controller.newPassword = val;
                controller.update();
              },
            ),
            const SizedBox(height: AppConst.paddingDefault),
            GetBuilder<UpdatePasswordController>(
              builder: (controller) {
                return PasswordField(
                  isNewPass: true,
                  label: localeLang(context).confirmPassword,
                  autofillHints: const [AutofillHints.newPassword],
                  hintText: localeLang(context).enterTheSamePassword,
                  onChanged: (val) => controller.confirmPassword = val,
                  otherPass: controller.newPassword,
                );
              }
            ),
            const SizedBox(height: AppConst.paddingExtraBig),
          ],
        ),
      ),
    );
  }
}
