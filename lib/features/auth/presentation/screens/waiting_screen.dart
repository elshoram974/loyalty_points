import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/auth/presentation/widgets/waiting/waiting_text_image.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../widgets/waiting/signup_image_text.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingExtraBig,
        ),
        children: [
          Center(child: Image.asset(AppAssets.fullLogo, width: 250)),
          const SizedBox(height: 25),
          const SignUpCompletedImageTextWidget(),
          const SizedBox(height: 25),
          const WaitingTextImageWidget(),
          const SizedBox(height: 25),
          CustomFilledButton(
            onPressed: Get.back,
            text: localeLang(context).backToLogin,
            style: context.textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}



