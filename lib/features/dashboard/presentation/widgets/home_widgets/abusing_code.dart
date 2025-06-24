import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/home_widgets/abusing_code_steps.dart';

import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class AbusingCode extends StatelessWidget {
  const AbusingCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppConst.paddingDefault),
          child: Text(localeLang(context).howToAbusingCode,
              style: context.textTheme.headlineSmall),
        ),
        // const SizedBox(height: AppConst.paddingDefault),

        Column(
          children: [
            AbusingCodeSteps(
              ico: AppAssets.removeSticker,
              title: localeLang().removeSticker,
              subTitle:
                  localeLang().removeStickerFromApp(localeLang().business_name),
            ),
            const SizedBox(height: AppConst.paddingSmall),
            AbusingCodeSteps(
                ico: AppAssets.findBarCode,
                title: localeLang().findCode,
                subTitle: localeLang().uniqueCodeUnderLabel),
            const SizedBox(height: AppConst.paddingSmall),
            AbusingCodeSteps(
              ico: AppAssets.enterBarCode,
              title: localeLang().enterCode,
              subTitle: localeLang().enterCodeOnWebsiteOrApp,
            ),
            const SizedBox(height: AppConst.paddingBig),
          ],
        ),
        const SizedBox(height: AppConst.paddingExtraBig),
      ],
    );
  }
}
