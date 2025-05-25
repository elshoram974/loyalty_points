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
              const SliverToBoxAdapter(child: PointsBalanceWidget(pointsBalance: 5000,description: 'bnnb', isUncategorized: false,),),
          Expanded(
            child: Center(
              child: Text(
                localeLang(context).congratulationsCodeAddedSuccessfully,
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall,
              ),
            ),
          ),
          CustomFilledButton(
            onPressed: Get.back,
            filledColor: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(AppConst.radiusSmall),
            text: localeLang(context).home,
            style: context.textTheme.headlineSmall,
          ),
          const SizedBox(height: AppConst.paddingExtraBig)
        ],
      ),
    );
  }
}
