import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/functions/app_validate.dart';
import '../../controller/dashboard_controller.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/presentation/widgets/auth_field.dart';
import '../../controller/update_profile_controller.dart';
import 'edit_profile_image_widget.dart';

class EditProfileFields extends GetView<UpdateProfileController> {
  const EditProfileFields({super.key});
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Get.find<DashboardController>().user;
    return AutofillGroup(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            EditProfileImageWidget(
              userImage: user?.image?.path,
              onChanged: (file) => controller.profile = file,
            ),
            const SizedBox(height: AppConst.paddingDefault),
            AuthField(
              initialValue: user?.name,
              label: localeLang(context).fullName,
              suffixIconData: Icons.person,
              textCapitalization: TextCapitalization.words,
              autofillHints: const [AutofillHints.name],
              hintText: localeLang(context).enterYourFullName,
              onChanged: (val) => controller.fullName = val.trim(),
              validator: (val) => AppValidator.auth(
                val?.trim(),
                3,
                100,
                FieldType.name,
              ),
            ),
            const SizedBox(height: AppConst.paddingDefault),
            AuthField(
              suffixIconData: Icons.mail_rounded,
              autofillHints: const [AutofillHints.email],
              initialValue: user?.email,
              label: localeLang(context).email,
              hintText: localeLang(context).enterYourEmailAddress,
              textDirection: TextDirection.ltr,
              onChanged: (val) => controller.email = val.trim(),
              validator: (val) => AppValidator.auth(
                val?.trim(),
                0,
                100,
                FieldType.email,
              ),
            ),
            const SizedBox(height: AppConst.paddingDefault),
            AuthField(
              readOnly: true,
              suffixIconData: Icons.phone,
              autofillHints: const [AutofillHints.telephoneNumber],
              textInputAction: TextInputAction.done,
              label: localeLang(context).mobileNumber,
              initialValue: user?.phone,
              hintText: localeLang(context).enterYourMobileNumber,
              textDirection: TextDirection.ltr,
            ),
            const SizedBox(height: AppConst.paddingExtraBig),
          ],
        ),
      ),
    );
  }
}
