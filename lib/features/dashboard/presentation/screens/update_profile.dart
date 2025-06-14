import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../controller/update_profile_controller.dart';
import '../widgets/edit_profile/edit_profile_button.dart';
import '../widgets/edit_profile/edit_profile_fields.dart';

class UpdateProfileScreen extends GetView<UpdateProfileController> {
  const UpdateProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (isPopped, __) => controller.onPopInvoked(isPopped),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).edit_your_profile,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingBig),
        children: const [
          EditProfileFields(),
          EditProfileButton(),
        ],
      ),
    );
  }
}
