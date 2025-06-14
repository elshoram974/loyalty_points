import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class LogoSignUpWidget extends StatelessWidget {
  const LogoSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppConst.paddingExtraBig),
        Center(child: Image.asset(AppAssets.businessLogo, width: 120)),
        const SizedBox(height: AppConst.paddingDefault),
        Text(
          localeLang(context).signUp,
          textAlign: TextAlign.center,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppConst.paddingExtraBig),
      ],
    );
  }
}
