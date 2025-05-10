import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/filled_button.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../widgets/my_app_bar.dart';

class CodeAddedScreen extends StatelessWidget {
  const CodeAddedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const MyAppBar(),
      body: Column(
        children: [
          const PointsBalanceWidget(),
          Expanded(
            child: Center(
              child: Text(
                localeLang(context).congratueCodeAddedSuccessfully,
                style: context.textTheme.headlineSmall,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingExtraBig),
            child: CustomFilledButton(
              onPressed: () {
                Get.back();
              },
              filledColor: context.theme.primaryColor,
              borderRadius: BorderRadius.circular(AppConst.radiusSmall),
              text: localeLang(context).home,
              style: context.textTheme.headlineSmall,
              minimumSize: Size.fromHeight(AppConst.radiusExtraBig),
            ),
          ),
          const SizedBox(
            height: AppConst.paddingExtraBig,
          )
        ],
      ),
    );
  }
}
