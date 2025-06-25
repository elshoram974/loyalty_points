import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app_info.dart';
import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../../../core/utils/constants/app_strings.dart';

class LoginIntroTextWidget extends StatelessWidget {
  const LoginIntroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      id: AppString.updateLoginIntro,
      builder: (controller) {
        if(AppInfo.config?.loginIntro == null) return const SizedBox();
        return Text(
          AppInfo.config!.loginIntro!,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall,
        );
      },
    );
  }
}