import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/login_controller.dart';
import '../widgets/login/login_buttons.dart';
import '../widgets/login/login_fields.dart';
import '../widgets/login/login_intro_text_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (_, __) =>
          Get.find<LoginController>().onPopInvoked(),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingBig),
        children: [
          const SizedBox(height: AppConst.paddingExtraBig),
          Text(
            localeLang(context).welcome_to_businessName(
              localeLang(context).business_name,
            ),
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingExtraBig,
            ),
            child: Image.asset(AppAssets.businessLogo),
          ),
          const SizedBox(height: AppConst.paddingDefault),
          const LoginIntroTextWidget(),
          const SizedBox(height: AppConst.paddingExtraBig),
          Text(
            localeLang(context).login,
            textAlign: TextAlign.center,
            style: context.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppConst.paddingExtraBig),
          const LoginFields(),
          const LoginButtons(),
        ],
      ),
    );
  }
}
