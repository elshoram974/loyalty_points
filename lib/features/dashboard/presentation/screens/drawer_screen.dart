import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/drawer_widgets/tile_button_widget.dart';

class HomeDrawer extends GetView<DashboardController> {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.primaryColor,
      child: Column(
        spacing: AppConst.paddingDefault,
        children: [
          const Spacer(flex: 4),
          TileButtonWidget(
            icon: Icons.person_outline_outlined,
            title: localeLang(context).profile,
            onTap: () {},
          ),
          TileButtonWidget(
            icon: Icons.stars_outlined,
            title: localeLang(context).pointsHistory,
            onTap: () {
              controller.changeHomeScreen(DashboardTabsEnum.points.index);
            },
          ),
          TileButtonWidget(
            icon: Icons.sync_outlined,
            title: localeLang(context).redeemPoints,
            onTap: () {
              controller.changeHomeScreen(DashboardTabsEnum.redeemPoints.index);
            },
          ),
          const Spacer(flex: 5),
          // TileButtonWidget(
          //   icon: Icons.language_outlined,
          //   title: localeLang(context).changeLanguageTo(
          //     Get.find<ConfigController>().alternateLocale.languageName,
          //   ),
          //   onTap: Get.find<ConfigController>().toggleLanguage,
          // ),
          TileButtonWidget(
            icon: Icons.login_outlined,
            title: localeLang(context).logOut,
            onTap: controller.logOut,
          ),
          const SizedBox(height: AppConst.paddingDefault)
        ],
      ),
    );
  }
}
