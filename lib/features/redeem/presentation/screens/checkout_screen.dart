import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../auth/presentation/widgets/auth_field.dart';
import '../../../dashboard/presentation/widgets/my_app_bar.dart';
import '../widgets/available_points/instructions_replacement_container.dart';
import '../widgets/points_builder_widget.dart';
import '../widgets/redeem_points_final/cancel_confirm_buttons.dart';
import '../widgets/redeem_points_final/confirm_replacement_colum.dart';
import '../widgets/redeem_points_final/payment_methods_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const MyAppBar(),
        body: ListView(
          children: [
            PointsBalanceWidget(
              description: localeLang(context).transferablePointsBalance,
            ),
            PointsBuilderWidget(
              builder: (_, __, helper) {
                return ContainerForReplacement(
                  text: localeLang(context).cashbackOnPoints(
                    helper.redeemableBalanceString,
                    helper.convertiblePointsString,
                  ),
                );
              },
            ),
            const PaymentMethodsContainer(),
            const SizedBox(height: AppConst.paddingDefault),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingDefault,
              ),
              child: AuthField(
                label: localeLang(context).instaPayNumber,
                labelStyle: context.textTheme.headlineSmall,
              ),
            ),
            const ConfirmReplacement(),
            const PaymentsMethodCancelAndConfirmButtons(),
          ],
        ));
  }
}
