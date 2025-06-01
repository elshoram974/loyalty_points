import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../auth/presentation/widgets/auth_field.dart';
import '../../../dashboard/presentation/widgets/my_app_bar.dart';
import '../controller/redeem_controller.dart';
import '../widgets/available_points/instructions_replacement_container.dart';
import '../widgets/points_builder_widget.dart';
import '../widgets/checkout_widgets/cancel_confirm_buttons.dart';
import '../widgets/checkout_widgets/payment_methods_container.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        canPop: false,
        onPopInvokedWithResult: (_, __) =>
            Get.find<RedeemController>().onPopInvoked(),
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
                    helper.config?.currency ?? '',
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
              child: GetBuilder<RedeemController>(
                builder: (c) {
                  return AuthField(
                    fieldKey: c.fieldKey,
                    onPhoneInputChanged: c.setPhoneNumber,
                    label:
                        localeLang(context).paymentMethodNumber(c.payment.name),
                    hintText: localeLang(context)
                        .enterPaymentMethodNumber(c.payment.name),
                    isPhoneNumber: true,
                    countries: const ["EG"],
                    labelStyle: context.textTheme.headlineSmall,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingExtraBig,
                vertical: AppConst.paddingDefault,
              ),
              child: PointsBuilderWidget(
                builder: (_, __, helper) {
                  return Text(
                    localeLang(context).replacePointsWithCurrency(
                      helper.redeemableBalanceString,
                      helper.convertiblePointsString,
                      helper.config?.currency ?? '',
                    ),
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            const PaymentsMethodCancelAndConfirmButtons(),
          ],
        ));
  }
}
