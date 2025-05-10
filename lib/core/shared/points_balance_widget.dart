import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class PointsBalanceWidget extends StatelessWidget {
  const PointsBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingSmall,
      ),
      decoration: BoxDecoration(
        color: context.theme.primaryColor,
        borderRadius: BorderRadius.circular(AppConst.radiusDefault),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localeLang(context).pointsBalance,
            style: context.textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(AppConst.paddingSmall),
                  child: Text(
                    "5,222",
                    style: context.textTheme.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(AppConst.radiusExtraBig),
                ),
                child: Center(
                  child: Text(
                    '100' + localeLang(context).egyptianPound,
                    style: context.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConst.paddingSmall),
          Row(
            children: [
              Image.asset(AppAssets.iconBalance, width: 30),
              const SizedBox(width: AppConst.paddingExtraSmall),
              Text(
                localeLang(context).transferablePointsBalance,
                style: context.textTheme.labelMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
