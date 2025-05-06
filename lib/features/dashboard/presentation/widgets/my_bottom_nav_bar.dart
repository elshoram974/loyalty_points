import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../controller/dashboard_controller.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          const BorderRadius.vertical(top: Radius.circular(AppConst.radiusBig)),
      child: GetBuilder<DashboardController>(
          id: AppString.updateSelectedScreen,
          builder: (controller) {
            return BottomNavigationBar(
              onTap: (value) {
                if (value == DashboardTabsEnum.menu.index) {
                  return Scaffold.of(context).openEndDrawer();
                }
                controller.changeHomeScreen(value);
              },
              currentIndex: controller.selectedScreen,
              showUnselectedLabels: true,
              showSelectedLabels: true,
              enableFeedback: false,
              unselectedItemColor: context.iconColor,
              selectedItemColor: context.theme.primaryColor,
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                DashboardTabsEnum.values.length,
                (i) {
                  final DashboardTabItem type = DashboardTabsEnum.values[i].data;
                  if (type.isHidden) {
                    return const BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      label: '',
                    );
                  }
                  return BottomNavigationBarItem(
                    icon: Icon(type.icon, color: context.iconColor),
                    label: type.label,
                    activeIcon: FaIcon(
                      type.icon,
                      color: context.theme.primaryColor,
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}
