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
        final bool isSelected = controller.selectedScreen == redeemData.index;
        final Color foregroundColor = isSelected
            ? context.theme.primaryColor
            : context.theme.bottomNavigationBarTheme.backgroundColor!;
        return FloatingActionButton.small(
          onPressed: () => controller.changeHomeScreen(redeemData.index),
          backgroundColor: isSelected
              ? context.theme.bottomNavigationBarTheme.backgroundColor!
              : context.theme.primaryColor,
          foregroundColor: foregroundColor,
          shape: CircleBorder(
            side: BorderSide(
              color: foregroundColor,
              width: AppConst.borderSmallWidth,
            ),
          ),
          child: FaIcon(redeemData.data.activeIcon),
        );
      },
    );
  }
}
