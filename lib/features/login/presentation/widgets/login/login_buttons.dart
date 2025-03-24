import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../controller/login_controller.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Align(
          //   alignment: AlignmentDirectional.centerStart,
          //   child: TextButton(
          //     onPressed: controller.isLoading ? null : () {},
          //     child: Text(
          //       localeLang(context).forgetPassword,
          //       style: context.textTheme.bodyLarge,
          //     ),
          //   ),
          // ),
          const SizedBox(height: 30),
          CustomFilledButton(
            text: localeLang(context).login,
            isLoading: controller.isLoading,
            onPressed: controller.login,
            style: context.textTheme.headlineMedium,
          ),
        ],
      );
    });
  }
}
