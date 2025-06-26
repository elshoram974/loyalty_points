import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/helper/show_my_dialog.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../../../../core/utils/types/social_media_type.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/drawer_widgets/tile_button_widget.dart';
import 'contact_us.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class MenuScreen extends GetView<DashboardController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<SocialMediaType> items = List.unmodifiable(
      AppInfo.config?.socialMedia ?? [],
    );
    return CustomScaffold(
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          TileButtonWidget(
            icon: Icons.person_outline_outlined,
            title: localeLang(context).profile,
            onTap: () => Get.toNamed(AppRoute.profileDetails),
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
            onTap: () => Get.toNamed(AppRoute.redeemScreen),
          ),
          TileButtonWidget(
            icon: Icons.policy_outlined,
            title: localeLang(context).termsConditions,
            onTap: () => Get.to(() => const TermsScreen()),
          ),
          TileButtonWidget(
            icon: Icons.description_outlined,
            title: localeLang(context).privacy_policy,
            onTap: () => Get.to(() => const PrivacyScreen()),
          ),
          if(items.isNotEmpty)
          TileButtonWidget(
            icon: Icons.contact_support_sharp,
            title: localeLang(context).contactUs,
            onTap: () => Get.to(() => ContactUsScreen(items)),
          ),

          TileButtonWidget(
            icon: Icons.delete_outline,
            title: localeLang(context).delete_account,
            onTap: () => ShowMyDialog.dialog(
              body: localeLang().do_you_want_to_delete_your_account,
              title: localeLang().delete_account,
              textCancel: localeLang().delete_account,
              onPressCancel: controller.logOut,
              textConfirm: localeLang().cancel,
              onPressConfirm: Get.back,
            ),
          ),
          // TileButtonWidget(
          //   icon: Icons.language_outlined,
          //   title: localeLang(context).changeLanguageTo(
          //     Get.find<ConfigController>().alternateLocale.languageName,
          //   ),
          //   onTap: Get.find<ConfigController>().toggleLanguage,
          // ),
          TileButtonWidget(
            icon: Icons.logout_outlined,
            title: localeLang(context).logOut,
            color: AppColor.logout,
            trailingIcon: null,
            onTap: () => ShowMyDialog.dialog(
              body: localeLang().do_you_want_to_logout,
              title: localeLang().logout,
              textCancel: localeLang().logOut,
              onPressCancel: controller.logOut,
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
