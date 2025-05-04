import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../domain/entity/navigation_bar_entity.dart';
import '../controller/home_controller.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppConst.radiusBig),
        child: GetBuilder<HomeController>(
          id: AppString.updateSelectedScreen,
          builder: (controller) {
            return BottomNavigationBar(
              onTap: (value) {
                if(value == 2) {
                  return;
                } else if(value == navigationData.length - 1){ 
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
                navigationData.length,
                (i) {
                  final NavigationBarEntity? button = navigationData[i];
                  if (button == null) {
                    return const BottomNavigationBarItem(
                      icon: SizedBox.shrink(),
                      label: '',
                    );
                  }
                  return BottomNavigationBarItem(
                    icon: Icon(button.icon, color: context.iconColor),
                    label: button.label ?? '',
                    activeIcon: Icon(button.icon, color: context.theme.primaryColor),
                  );
                },
              ),
            );
          }
        ),
      );
  }
  static List<NavigationBarEntity?> get navigationData => [
    NavigationBarEntity(
      screen: ListView(), 
      icon: Icons.home_outlined, 
      activeIcon: Icons.home, 
      label: localeLang().home,
    ),
    NavigationBarEntity(
      screen: const Placeholder(), 
      icon: Icons.assignment_outlined, 
      activeIcon: Icons.assignment, 
      label: localeLang().orders,
    ),
    null,
    NavigationBarEntity(
      screen: const Placeholder(), 
      icon: Icons.assignment_outlined, 
      activeIcon: Icons.assignment, 
      label: localeLang().points,
    ),
    NavigationBarEntity(
      screen: const Placeholder(), 
      icon: Icons.menu_outlined, 
      activeIcon: Icons.menu, 
      label: localeLang().menu,
    ),
  ];
}