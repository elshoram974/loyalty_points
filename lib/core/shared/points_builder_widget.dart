import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../app_info.dart';
import '../utils/config/controller/config_controller.dart';
import '../utils/constants/app_strings.dart';
import '../utils/helper/points_calc_helper.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/dashboard/presentation/controller/dashboard_controller.dart';

class PointsBuilderWidget extends StatelessWidget {
  const PointsBuilderWidget({
    super.key,
    this.configId = AppString.updateHomeUser,
    this.dashboardId = AppString.updateHomeUser,
    required this.builder,
  });

  final String? configId;
  final String? dashboardId;
  final Widget Function(
    DashboardController,
    ConfigController,
    PointsCalcHelper,
  ) builder;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      id: configId,
      builder: (configController) {
        return GetBuilder<DashboardController>(
          id: dashboardId,
          builder: (dashboardController) {
            final PointsCalcHelper pointsHelper = PointsCalcHelper(
              config: AppInfo.config,
              user: dashboardController.user ?? UserModel.empty(),
            );
            return builder(dashboardController, configController, pointsHelper);
          },
        );
      },
    );
  }
}
