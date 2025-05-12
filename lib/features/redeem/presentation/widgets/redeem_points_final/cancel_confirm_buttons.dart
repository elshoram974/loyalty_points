import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/routes/routes.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';


class PaymentsMethodCancelAndConfirmButtons extends StatelessWidget {
  const PaymentsMethodCancelAndConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const Size size = Size.fromHeight(40);
    final BorderRadius radius = BorderRadius.circular(AppConst.radiusSmall);
    final TextStyle? style = context.textTheme.headlineSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConst.paddingExtraBig,
        horizontal: AppConst.paddingDefault,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomFilledButton(
              onPressed: () => Navigator.maybePop(context),
              filledColor: Colors.grey,
              borderRadius: radius,
              text: localeLang(context).cancel,
              style: style,
              minimumSize: size,
            ),
          ),
          const SizedBox(width: AppConst.paddingDefault),
          Expanded(
            child: CustomFilledButton(
                  onPressed:()=>Get.toNamed(AppRoute.successredeemScreen),
                  filledColor: context.theme.primaryColor,
                  borderRadius: radius,
                  text: localeLang(context).confirm,
                  style: style,
                  minimumSize: size,
                ),
          ),
        ],
      ),
    );
  }
}
