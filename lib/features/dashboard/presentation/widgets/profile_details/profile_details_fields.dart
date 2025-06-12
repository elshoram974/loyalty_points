import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../../core/utils/constants/app_constants.dart';
import '../../../../../../core/utils/functions/app_validate.dart';
import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/shared/my_network_image.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/presentation/widgets/auth_field.dart';
import '../../controller/dashboard_controller.dart';
import '../my_app_bar.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});
  @override
  Widget build(BuildContext context) {
    final UserModel? user = Get.find<DashboardController>().user;
    return ListView(
      padding: const EdgeInsets.all(AppConst.paddingDefault),
      children: [
        Align(
          child: MyNetworkImage(
            user?.image?.path,
            height: 200,
            width: 200,
            borderRadius: BorderRadius.circular(500),
            placeHolder: UserImagePlaceHolder(name: user?.name ?? ''),
          ),
        ),
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
        const SizedBox(height: AppConst.paddingDefault),
        AuthField(
          readOnly: true,
          suffixIconData: Icons.mail_rounded,
          autofillHints: const [AutofillHints.email],
          initialValue: user?.email,
          label: localeLang(context).email,
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: AppConst.paddingDefault),
        AuthField(
          readOnly: true,
          suffixIconData: Icons.phone,
          autofillHints: const [AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.done,
          label: localeLang(context).mobileNumber,
          initialValue: user?.phone,
          textDirection: TextDirection.ltr,
        ),
        const SizedBox(height: AppConst.paddingBig),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 12,
          spacing: 12,
          children: [
            SizedBox(
              width: 290,
              child: OutlinedButton.icon(
                onPressed: () => Get.toNamed(AppRoute.editProfile),
                icon: Icon(Icons.edit, color: context.theme.primaryColor),
                label: Text(
                  localeLang(context).edit_your_profile,
                  style: TextStyle(color: context.theme.primaryColor),
                ),
                style: OutlinedButton.styleFrom(
                  side:
                      BorderSide(color: context.theme.primaryColor, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
              ),
            ),
            CustomFilledButton(
              text: localeLang(context).editPassword,
              icon: const Icon(Icons.lock, color: Colors.white),
              onPressed: () => Get.toNamed(AppRoute.editPassword),
              minimumSize: const Size(300, 50),
              filledColor: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
      ],
    );
  }
}
