import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/home_controller.dart';
import '../widgets/drawer_widgets/tile_button_widget.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({
    super.key,
  });

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
          ),
          TileButtonWidget(
            icon: Icons.stars_outlined,
            title: localeLang(context).pointsHistory,
          ),
          TileButtonWidget(
            icon: Icons.sync_outlined,
            title: localeLang(context).redeemPoints,
          ),
          const Spacer(flex: 5),
          TileButtonWidget(
            icon: Icons.language_outlined,
            title: localeLang(context).changeLanguageTo("arabic"),
          ),
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
