import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../widgets/avaliable_points/instructions_replacement_container.dart';
import '../widgets/avaliable_points/list_points_pounds.dart';

class ReplacemrntScreen extends StatelessWidget {
  const ReplacemrntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PointsBalanceWidget(description: 'bnnb', isUncategorized: false),
        ContainerForReplacement(
          text: localeLang(context)
              .toRedeemYourPointsInAppNameYouMustHave5000PointsOrMore(
            '5000',
            AppInfo.appName,
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
          child: Text(
            localeLang(context).avaliablePoints,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListOfPointsAndPounds(),
        const SizedBox(
          height: AppConst.paddingExtraBig,
        ),
        Center(
          child: CustomFilledButton(
            minimumSize: const Size(375, 50),
            borderRadius: BorderRadius.circular(AppConst.radiusSmall),
            onPressed: () => Get.toNamed(AppRoute.finalredeemScreen),
            text: localeLang(context).confirm,
            style: context.textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
