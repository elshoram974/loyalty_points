import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_color.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../widgets/home_widgets/cancel_confirm_buttons.dart';
import '../widgets/my_app_bar.dart';

class AddNewCodeScreen extends StatelessWidget {
  const AddNewCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const MyAppBar(),
      body: ListView(
        children: [
          const PointsBalanceWidget(),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingDefault,
              vertical: AppConst.paddingDefault,
            ),
            child: Text(
              localeLang(context).addNewCode,
              style: context.textTheme.headlineSmall,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
            child: TextFormField(
              decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.greyBackground,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.greyBackground,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppConst.paddingDefault,
                    horizontal: AppConst.paddingDefault),
                child: Text(
                  localeLang(context).pressToUseCamera,
                  style: context.textTheme.titleMedium,
                ),
              ),
              Flexible(child: Image.asset(AppAssets.findBarCode)),
            ],
          ),
          const CancelAndConfirmButtons(),
        ],
      ),
    );
  }
}
