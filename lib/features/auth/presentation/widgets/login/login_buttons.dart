import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../controller/login_controller.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Align(
            //   alignment: AlignmentDirectional.centerEnd,
            //   child: TextButton(
            //     onPressed: controller.isLoading ? null : () {},
            //     child: Text(
            //       localeLang(context).forgetPassword,
            //       style: context.textTheme.titleSmall
            //           ?.copyWith(color: context.theme.primaryColor),
            //     ),
            //   ),
            // ),
            const SizedBox(height: AppConst.paddingExtraBig),
            CustomFilledButton(
              text: localeLang(context).login,
              isLoading: controller.isLoading,
              onPressed: controller.login,
              style: context.textTheme.headlineMedium,
            ),
            if (controller.showBiometricsButton) ...[
              const SizedBox(height: AppConst.paddingDefault),
              Center(
                child: TextButton(
                  onPressed: controller.biometricsLogin,
                  child: Text(localeLang(context).loginWithBiometric),
                ),
              ),
            ],
            const SizedBox(height: 70),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textTheme.titleMedium,
                children: [
                  TextSpan(text: localeLang(context).doNotHaveAnAccount),
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: localeLang(context).signUp,
                      style: context.textTheme.titleMedium?.copyWith(
                        color: context.theme.primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: context.theme.primaryColor,
                        decorationThickness: 2,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(AppRoute.signUp)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
