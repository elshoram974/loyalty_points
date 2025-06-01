import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../widgets/available_points/instructions_replacement_container.dart';
import '../widgets/points_builder_widget.dart';

class ReplacementScreen extends StatelessWidget {
  const ReplacementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PointsBuilderWidget(
      builder: (_, __, pointsHelper) {
        return Column(
          children: [
            const PointsBalanceWidget(),
            ContainerForReplacement(
              text: localeLang(context)
                  .toRedeemYourPointsInAppNameYouMustHaveMinPointsOrMore(
                AppInfo.appName,
                pointsHelper.minimumRedeemablePointsString,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingDefault,
              ),
              child: Text(
                pointsHelper.chooseBasedOnPointsNeed<String>(
                  localeLang(context).notEnoughPointsToRedeem(
                    pointsHelper.user.pointsBalance.withSeparator,
                    pointsHelper.pointsShortfallString,
                  ),
                  localeLang(context).pointsConversionConfirmation(
                    pointsHelper.convertiblePointsString,
                    pointsHelper.redeemableBalanceString,
                    pointsHelper.config?.currency ?? '',
                    pointsHelper.remainingPointsString,
                  ),
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
                onPressed:
                    pointsHelper.chooseBasedOnPointsNeed<void Function()?>(
                  null,
                  () => Get.toNamed(AppRoute.checkoutScreen),
                ),
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
