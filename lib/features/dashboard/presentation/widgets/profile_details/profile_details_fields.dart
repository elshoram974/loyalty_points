import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/utils/functions/app_validate.dart';
import '../../../../../core/shared/my_network_image.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_color.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/presentation/widgets/auth_field.dart';
import '../../controller/dashboard_controller.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Get.find<DashboardController>().user;
    return Column(
      children: [
        GetBuilder<DashboardController>(builder: (controller) {
          return MyNetworkImage(
            controller.user?.image?.path,
            placeHolder: const CircleAvatar(
              radius: double.maxFinite,
              backgroundColor: AppColor.greyBackground,
            ),
          );
        }),
        const SizedBox(height: AppConst.paddingDefault),
        AuthField(
          readOnly: true,
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
        AuthField(
          readOnly: true,
          suffixIconData: Icons.mail_rounded,
          autofillHints: const [AutofillHints.email],
          initialValue: user?.email,
          label: localeLang(context).email,
        ),
        const SizedBox(height: AppConst.paddingDefault),
        AuthField(
          readOnly: true,
          suffixIconData: Icons.phone,
          autofillHints: [AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.done,
          label: localeLang(context).mobileNumber,
          initialValue: user?.phone,
        ),
        const SizedBox(height: AppConst.paddingBig),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(AppRoute.editProfile);
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: Text(
                localeLang(context).edit_your_profile,
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(width: AppConst.paddingDefault),
            ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(AppRoute.editPassword);
              },
              icon: const Icon(
                Icons.lock,
                color: Colors.white,
              ),
              label: Text(
                localeLang(context).editPassword,
                style: const TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: context.theme.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(height: AppConst.paddingDefault),
          ],
        ),
      ],
    );
  }
}
