import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/shared/custom_scaffold.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../dashboard/presentation/widgets/edit_profile/edit_profile_button.dart';
import '../controller/set_new_password_controller.dart';
import '../widgets/password_field.dart';

class ResetPasswordFields extends StatelessWidget {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetNewPasswordControllerImp(Get.find()));

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
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingExtraBig,
              vertical: AppConst.paddingExtraBig),
          children: [
            const SizedBox(height: AppConst.paddingExtraBig),
            PasswordField(
              isNewPass: true,
              label: localeLang(context).enterNewPassword,
              hintText: localeLang(context).enterNewPassword,
               onChanged: (val) {
                controller.newPassword = val;
                controller.update();
              },
            ),
            const SizedBox(height: AppConst.paddingExtraBig),
            GetBuilder<SetNewPasswordControllerImp>(
              builder: (controller) {
                return PasswordField(
                  label: localeLang(context).confirmPassword,
                  hintText: localeLang(context).enterNewPassword,
                  onChanged: (val) => controller.confirmPassword = val,
                  otherPass: controller.newPassword,
                );
              },
            ),
            const SizedBox(height: 3 * AppConst.paddingDefault),
             GetBuilder<SetNewPasswordControllerImp>(
            builder: (controller) {
              return EditProfileButton(
                isLoading: controller.isLoading,
                onUpdate: controller.SetNewPassword,
              );
            },
          ),
            // Center(
            //     child: FilledButton(
            //         style: FilledButton.styleFrom(
            //           minimumSize: const Size(350, 50),
            //           backgroundColor: context.theme.primaryColor,
            //         ),
            //         onPressed: () => controller.SetNewPassword(),
            //         child: Text(localeLang(context).changePassword))),
          ],
        ),
      ),
    );
  }
}
