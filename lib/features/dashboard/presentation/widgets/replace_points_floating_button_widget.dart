import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../controller/dashboard_controller.dart';

class ReplacePointsFloatingButtonWidget extends StatelessWidget {
  const ReplacePointsFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const DashboardTabsEnum redeemData = DashboardTabsEnum.redeemPoints;
    return GetBuilder<DashboardController>(
      id: AppString.updateSelectedScreen,
      builder: (controller) {
        return FloatingActionButton(
          onPressed: () => controller.changeHomeScreen(redeemData.index),
          shape: CircleBorder(
            side: BorderSide(
              style: controller.selectedScreen == redeemData.index
                  ? BorderStyle.none
                  : BorderStyle.solid,
              color: context.theme.bottomNavigationBarTheme.backgroundColor!,
              width: AppConst.borderDefaultWidth,
            ),
          ),
          child: FaIcon(redeemData.data.activeIcon),
        );
      },
    );
  }
}
