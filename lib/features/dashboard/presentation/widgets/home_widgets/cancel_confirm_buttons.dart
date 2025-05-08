import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class CancelAndConfirmButtons extends StatelessWidget {
  const CancelAndConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConst.paddingExtraBig,
          horizontal: AppConst.paddingDefault),
      child: Row(children: [
        Expanded(
          child: CustomFilledButton(
            onPressed: Get.back,
            filledColor: Colors.grey,
            borderRadius: BorderRadius.circular(AppConst.radiusSmall),
            text: localeLang(context).cancel,
            style: context.textTheme.headlineSmall,
            minimumSize: Size.fromHeight(40),
          ),
        ),
        const SizedBox(width: AppConst.paddingDefault),
        Expanded(
          child: CustomFilledButton(
            onPressed: (){
              Get.toNamed(AppRoute.codeAddedScreen);
            },
            filledColor: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(AppConst.radiusSmall),
            text: localeLang(context).confirm,
            style: context.textTheme.headlineSmall,
            minimumSize: Size.fromHeight(40),
          ),
        
        ),
      ]),
    );
  }
}
