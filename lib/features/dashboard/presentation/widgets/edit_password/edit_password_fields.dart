import 'package:flutter/material.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

import '../../../../auth/presentation/widgets/password_field.dart';

class EditPasswordFields extends StatelessWidget {
  const EditPasswordFields({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
