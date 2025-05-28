import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/functions/calc_helper.dart';
import '../../../../core/utils/models/config_model.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../dashboard/presentation/controller/dashboard_controller.dart';
import '../widgets/available_points/instructions_replacement_container.dart';

class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      id: AppString.updateHomeUser,
      builder: (controller) {
        final ConfigModel? config = AppInfo.config;
        final UserModel user = controller.user ?? UserModel.empty();
        final int? pointPerPound = config?.onePoundEquity(user.type);
        final int points = CalcHelper.getPointsToConvert(
          points: user.pointsBalance,
          pointPerPound: pointPerPound,
        );
        final double balance = CalcHelper.calcBalance(
          points: points,
          pointPerPound: pointPerPound,
        );
        final String remainingPoints =
            (user.pointsBalance - points).abs().withSeparator;

        final int minPoints = config?.oneMinimumPointsToRedeem(user.type) ??
            (user.pointsBalance + 1);

        final int pointsNeeded = minPoints - user.pointsBalance;

        final bool needMorePoints = pointsNeeded > 0;

        return Column(
          children: [
            PointsBalanceWidget(
              description: localeLang(context).transferablePointsBalance,
            ),
            ContainerForReplacement(
              text: localeLang(context)
                  .toRedeemYourPointsInAppNameYouMustHaveMinPointsOrMore(
                AppInfo.appName,
                config?.oneMinimumPointsToRedeem(user.type)?.withSeparator ??
                    '0',
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingDefault,
              ),
              child: Text(
                needMorePoints
                    ? localeLang(context).notEnoughPointsToRedeem(
                        user.pointsBalance.withSeparator,
                        pointsNeeded.withSeparator,
                      )
                    : localeLang(context).pointsConversionConfirmation(
                        points.withSeparator,
                        balance.withSeparator,
                        config?.currency ?? '',
                        remainingPoints,
                      ),
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: CustomFilledButton(
                minimumSize: const Size(375, 50),
                borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                onPressed: needMorePoints
                    ? null
                    : () => Get.toNamed(AppRoute.checkoutScreen),
                text: localeLang(context).confirm,
                style: context.textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 50),
          ],
        );
      },
    );
  }
}
