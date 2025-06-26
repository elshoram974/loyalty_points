import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../dashboard/presentation/widgets/my_app_bar.dart';
import '../widgets/available_points/instructions_replacement_container.dart';
import '../../../../core/shared/points_builder_widget.dart';

class RedeemSuccessScreen extends StatelessWidget {
  const RedeemSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (isPop, _) {
        if (!isPop) goHome();
      },
      appBar: const MyAppBar(),
      body: ListView(
        children: [
          const PointsBalanceWidget(isUncategorized: true),
          PointsBuilderWidget(
            builder: (_, __, helper) {
              return ContainerForReplacement(
                text: localeLang(context).cashbackOnPoints(
                  helper.redeemableBalanceString,
                  helper.config?.currency ?? '',
                  helper.convertiblePointsString,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConst.paddingBig,
              horizontal: AppConst.paddingExtraBig,
            ),
            child: Text(
              localeLang(context).yourOrderConfirmed,
              textAlign: TextAlign.center,
              style: context.textTheme.headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingExtraBig,
            ),
            child: CustomFilledButton(
              onPressed: goHome,
              filledColor: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(AppConst.radiusSmall),
              text: localeLang(context).home,
              style: context.textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }

  void goHome() => Get.offAllNamed(AppRoute.home);
}
