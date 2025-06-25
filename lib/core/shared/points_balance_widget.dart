import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../app_info.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/dashboard/presentation/controller/dashboard_controller.dart';
import '../../features/dashboard/presentation/widgets/replace_points_floating_button_widget.dart';
import '../utils/config/controller/config_controller.dart';
import '../utils/constants/app_strings.dart';
import '../utils/helper/points_calc_helper.dart';
import 'custom_loading.dart';

class PointsBalanceWidget extends StatelessWidget {
  const PointsBalanceWidget({super.key, this.isUncategorized = false});
  final bool isUncategorized;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingDefault,
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
              if (isUncategorized)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppConst.radiusSmall),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppConst.paddingSmall,
                      vertical: AppConst.paddingExtraSmall,
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppAssets.earned, width: 20),
                        Text(
                          localeLang().unCategorized,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: context.theme.primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
         const SizedBox(height: AppConst.paddingDefault),
          const _BalancePointsWidget(),
          const SizedBox(height: AppConst.paddingDefault),
          Row(
            children: [
              Image.asset(AppAssets.iconBalance, width: 30),
              const SizedBox(width: AppConst.paddingExtraSmall),
              Flexible(
                child: Text(
                  localeLang(context).transferablePointsBalance,
                  style: context.textTheme.labelMedium
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalancePointsWidget extends StatelessWidget {
  const _BalancePointsWidget();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        id: AppString.updateBalance,
        builder: (dashboardController) {
          final UserModel user = dashboardController.user ?? UserModel.empty();
          return CustomLoadingWidget(
            isLoading: dashboardController.isLoadingUserData,
            ignoreContainers: true,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Row(
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(AppConst.paddingSmall)
                              .copyWith(bottom: 0),
                          child: Text(
                            user.pointsBalance.withSeparator,
                            style: context.textTheme.headlineLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppConst.paddingDefault,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(
                            AppConst.radiusExtraBig,
                          ),
                        ),
                        child: GetBuilder<ConfigController>(
                          id: AppString.updateBalance,
                          builder: (configController) {
                            final PointsCalcHelper pointsCalcHelper =
                                PointsCalcHelper(
                              config: AppInfo.config,
                              user: user,
                            );
                            return CustomLoadingWidget(
                              isLoading: configController.isLoadingConfig,
                              child: Center(
                                child: Text(
                                  '${pointsCalcHelper.redeemableBalanceString} ${pointsCalcHelper.config?.currency ?? ''}',
                                  style: context.textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const ReplacePointsFloatingButtonWidget(),
              ],
            ),
          );
        });
  }
}
