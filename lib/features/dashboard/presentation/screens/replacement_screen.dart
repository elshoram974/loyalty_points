import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_color.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../core/shared/points_balance_widget.dart';

class ReplacemrntScreen extends StatelessWidget {
  const ReplacemrntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PointsBalanceWidget(),
        Container(
          decoration: BoxDecoration(
            color: AppColor.greyBackground,
            borderRadius: BorderRadius.circular(AppConst.radiusDefault),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.paddingDefault,
            vertical: AppConst.paddingDefault,
          ),
          margin: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingDefault,
              vertical: AppConst.paddingDefault),
          child: Text(
            textAlign: TextAlign.center,
            localeLang(context)
                .toRedeemYourPointsinPetrojakYouMustHave5000PointsOrMore,
            style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
          child: Text(
            localeLang(context).avaliablePoints,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            ),
        )
      ],
    );
  }
}
