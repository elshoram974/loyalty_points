import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../dashboard/presentation/widgets/my_app_bar.dart';
import '../widgets/avaliable_points/instructions_replacement_container.dart';

class RedeemSucessScreen extends StatelessWidget {
  const RedeemSucessScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const MyAppBar(),
        body: ListView(
          children: [
            const PointsBalanceWidget(
              description: 'bnnb',
              isUncategorized: false,
            ),
            ContainerForReplacement(
              text: localeLang(context).cashbackOnPoints('100', '100'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppConst.paddingBig,
                horizontal: AppConst.paddingExtraBig,
              ),
              child: Text(
                localeLang().yourOrderConfirmed,
                style: context.textTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingExtraBig,
              ),
              child: CustomFilledButton(
                onPressed: () => Get.toNamed(AppRoute.home),
                filledColor: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                text: localeLang(context).home,
                style: context.textTheme.headlineSmall,
              ),
            ),
          ],
        ));
  }
}
