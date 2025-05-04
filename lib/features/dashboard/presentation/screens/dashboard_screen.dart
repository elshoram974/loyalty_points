import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../controller/home_controller.dart';
import '../widgets/my_bottom_nav_bar.dart';
import '../widgets/replace_points_floating_button_widget.dart';
import 'drawer_screen.dart';
import '../widgets/my_app_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (_, __) => Get.find<HomeController>().onPopInvoked(),
      appBar: const MyAppBar(),
      drawer: const HomeDrawer(),
      floatingActionButton: const ReplacePointsFloatingButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomNavBar(),
      body: GetBuilder<HomeController>(
        id: AppString.updateSelectedScreen,
        builder: (controller) {
          return MyBottomNavBar.navigationData[controller.selectedScreen]?.screen ?? const SizedBox();
        },
      ),
    );
  }
}
