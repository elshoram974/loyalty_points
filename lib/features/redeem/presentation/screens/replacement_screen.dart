import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../dashboard/presentation/controller/dashboard_controller.dart';
import '../widgets/available_points/instructions_replacement_container.dart';
import '../widgets/available_points/list_points_pounds.dart';

class ReplacementScreen extends GetView<DashboardController> {
  const ReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PointsBalanceWidget(
          description: localeLang(context).transferablePointsBalance,
        ),
        ContainerForReplacement(
          text: localeLang(context)
              .toRedeemYourPointsInAppNameYouMustHaveMinPointsOrMore(
            AppInfo.appName,
            AppInfo.config
                    ?.oneMinimumPointsToRedeem(
                        (controller.user ?? UserModel.empty()).type)
                    ?.withSeparator ??
                '0',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.paddingDefault,
          ),
          child: Text(
            localeLang(context).availablePoints,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListOfPointsAndPounds(),
        const SizedBox(height: AppConst.paddingExtraBig),
        Center(
          child: CustomFilledButton(
            minimumSize: const Size(375, 50),
            borderRadius: BorderRadius.circular(AppConst.radiusSmall),
            onPressed: () => Get.toNamed(AppRoute.checkoutScreen),
            text: localeLang(context).confirm,
            style: context.textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
