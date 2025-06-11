import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/privacy_screen.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/drawer_widgets/tile_button_widget.dart';
import 'terms_screen.dart';

class HomeDrawer extends GetView<DashboardController> {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.primaryColor,
      child: Column(
        spacing: AppConst.paddingDefault,
        children: [
          const Spacer(flex: 2),
          TileButtonWidget(
            icon: Icons.person_outline_outlined,
            title: localeLang(context).profile,
            onTap: () {
              Get.toNamed(AppRoute.profileDetails);
            },
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
          TileButtonWidget(
            icon: Icons.policy_outlined,
            title: localeLang(context).termsConditions,
            onTap: () {
              Get.to(TermsScreen());
            },
          ),
          TileButtonWidget(
            icon: Icons.description_outlined,
            title: localeLang(context).privacy_policy,
            onTap: () {
              Get.to(PrivacyScreen());
            },
          ),

          TileButtonWidget(
            icon: Icons.delete_outline,
            title: localeLang(context).delete_account,
            onTap: () => ShowMyDialog.dialog(
              body: localeLang().do_you_want_to_delete_your_account,
              title: localeLang().delete_account,
              textCancel: localeLang().delete_account,
              onPressCancel: () {
                Get.back();
              },
              textConfirm: localeLang().cancel,
              onPressConfirm: Get.back,
            ),
          ),
          const Spacer(flex: 6),
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
            onTap: () => ShowMyDialog.dialog(
              body: localeLang().do_you_want_to_logout,
              title: localeLang().logout,
              textCancel: localeLang().logOut,
              onPressCancel: () {
               controller.logOut();
              },
              textConfirm: localeLang().cancel,
              onPressConfirm: Get.back,
            ),
          ),
          const SizedBox(height: AppConst.paddingDefault),
        ],
      ),
    );
  }
}
