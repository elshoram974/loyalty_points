import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../auth/data/models/user_model.dart';
import '../controller/update_password_controller.dart';
import '../widgets/edit_password/edit_password_fields.dart';
import '../widgets/edit_profile/edit_profile_button.dart';

class EditPasswordScreen extends GetView<UpdatePasswordController> {
  const EditPasswordScreen({super.key, this.user});
  final UserModel? user;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (popped, __) => controller.onPopInvoked(popped),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).editPassword,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          const EditPasswordFields(),
          const SizedBox(height: 100),
          GetBuilder<UpdatePasswordController>(
            builder: (controller) {
              return EditProfileButton(
                isLoading: controller.isLoading,
                onUpdate: controller.updatePassword,
              );
            },
          ),
        ],
      ),
    );
  }
}
