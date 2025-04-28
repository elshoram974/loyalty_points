import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/sign_up_controller.dart';
import '../widgets/sign_up/logo_sign_up_widget.dart';
import '../widgets/sign_up/sign_up_buttons.dart';
import '../widgets/sign_up/sign_up_fields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (_, __) => Get.find<SignUpController>().onPopInvoked(),
      body: Form(
        key: Get.find<SignUpController>().formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppConst.paddingBig),
          children: const [
            LogoSignUpWidget(),
            SignUpFields(),
            SignUpButtons(),
          ],
        ),
      ),
    );
  }
}
