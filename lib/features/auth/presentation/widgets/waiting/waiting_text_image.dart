import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_color.dart';

class WaitingTextImageWidget extends StatelessWidget {
  const WaitingTextImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.waitingImage),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          localeLang(context).beforeYouCanLoginAnAdministratorMustManuallyActivateYourAccount,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(
          textAlign: TextAlign.center,
          localeLang(context).PleaseWaitthisMayTakeSomeTime,
          style: context.textTheme.titleMedium?.copyWith(
            color: AppColor.primaryLight,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}