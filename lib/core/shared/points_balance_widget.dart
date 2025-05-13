import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class PointsBalanceWidget extends StatelessWidget {
  const PointsBalanceWidget({
    super.key,
    required this.pointsBalance,
    required this.pound,
    required this.description,
    required this.isuncategorized,
  });
  final double pointsBalance;
  final double pound;
  final String description;
  final bool isuncategorized;

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
          Row(
            children: [
              Expanded(
                child: Text(
                  localeLang(context).pointsBalance,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              isuncategorized
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(AppConst.radiusSmall),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppConst.paddingSmall,
                            vertical: AppConst.paddingExtraSmall),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.earned, width: 20),
                            Text(
                              localeLang().uncategorized,
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: context.theme.primaryColor),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(AppConst.paddingSmall),
                  child: Text(
                    pointsBalance.withSeparator,
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
                    pound.withSeparator + localeLang(context).egyptianPound,
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
                description,
                //localeLang(context).transferablePointsBalance,
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
