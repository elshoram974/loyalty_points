import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/types/dashboard_tabs.dart';
import '../../controller/dashboard_controller.dart';

class AddNewBarcodeFloatingButton extends StatelessWidget {
  const AddNewBarcodeFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    const DashboardTabsEnum addPoints = DashboardTabsEnum.addPoints;
    return GetBuilder<DashboardController>(
      id: AppString.updateSelectedScreen,
      builder: (controller) {
        final bool isSelected = controller.selectedScreen == addPoints.index;
        final Color foregroundColor = isSelected
            ? context.theme.primaryColor
            : context.theme.bottomNavigationBarTheme.backgroundColor!;
        return FloatingActionButton(
          heroTag: addPoints.data.label,
          onPressed: () => controller.changeHomeScreen(addPoints.index),
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
          child: FaIcon(addPoints.data.activeIcon),
        );
      },
    );
  }
}
