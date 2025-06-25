import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app_info.dart';
import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_strings.dart';

class LoginIntroTextWidget extends StatelessWidget {
  const LoginIntroTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      id: AppString.updateLoginIntro,
      builder: (controller) {
        return Text(
          AppInfo.config?.loginIntro ??
              localeLang(context)
                  .loyalty_program_for_PetroJac_oil_shops_and_station_agents_products,
          textAlign: TextAlign.center,
          style: context.textTheme.bodySmall,
        );
      },
    );
  }
}