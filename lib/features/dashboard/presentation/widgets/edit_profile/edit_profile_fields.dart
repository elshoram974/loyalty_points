import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/functions/app_validate.dart';
import '../../controller/dashboard_controller.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/presentation/widgets/auth_field.dart';
import '../../../../auth/presentation/widgets/password_field.dart';
import '../../../../auth/presentation/widgets/sign_up/attachments_validation_widget.dart';

class EditProfileFields extends StatelessWidget {
  const EditProfileFields({super.key});
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Get.find<DashboardController>().user;
    return Column(
      children: [
        AttachmentsValidationWidget(
          title: localeLang(context).edit_profile_image,
          errorMessage: localeLang(context).uHaveToAddProfileImage,
          topPadding: 0,
          files: [null],
          onChanged: (p0) {},
        ),
         const SizedBox(
          height: AppConst.paddingDefault
        ),
        AuthField(
          readOnly: true,
          suffixIconData: Icons.mail_rounded,
          autofillHints: const [AutofillHints.email],
          initialValue: user?.email,
          label: localeLang(context).email,
        ),
        const SizedBox(
          height: AppConst.paddingDefault
        ),
        AuthField(
          readOnly: true,
          suffixIconData: Icons.phone,
          autofillHints: [AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.done,
          label: localeLang(context).mobileNumber,
          initialValue: user?.phone,
        ),
        const SizedBox(height: AppConst.paddingDefault),
        AuthField(
          initialValue: user?.name,
          label: localeLang(context).fullName,
          suffixIconData: Icons.person,
          textCapitalization: TextCapitalization.words,
          autofillHints: const [AutofillHints.name],
          hintText: localeLang(context).enterYourFullName,
          validator: (val) =>
              AppValidator.auth(val?.trim(), 3, 100, FieldType.name),
        ),
        const SizedBox(
          height: AppConst.paddingDefault,
        ),
        PasswordField(
          isNewPass: false,
          label: localeLang(context).current_password,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.newPassword],
          hintText: localeLang(context).current_password,
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
        ),
        const SizedBox(
          height: AppConst.paddingDefault,
        ),
        PasswordField(
          label: localeLang(context).confirmPassword,
          autofillHints: const [AutofillHints.newPassword],
          hintText: localeLang(context).enterTheSamePassword,
        ),
        const SizedBox(height: AppConst.paddingExtraBig),
      ],
    );
  }
}
