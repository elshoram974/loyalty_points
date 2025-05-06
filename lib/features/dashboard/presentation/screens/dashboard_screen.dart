import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/types/dashboard_tabs.dart';
import '../controller/dashboard_controller.dart';
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
      onPopInvokedWithResult: (_, __) => Get.find<DashboardController>().onPopInvoked(),
      appBar: const MyAppBar(),
      drawer: const HomeDrawer(),
      floatingActionButton: const ReplacePointsFloatingButtonWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const MyBottomNavBar(),
      body: GetBuilder<DashboardController>(
        id: AppString.updateSelectedScreen,
        builder: (controller) {
          return AnimatedSwitcher(
            duration: AppConst.animationsDefault,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: KeyedSubtree(
              key: ValueKey(controller.selectedScreen),
              child: DashboardTabsEnum.values[controller.selectedScreen].data.screen,
            ),
          );
        },
      ),
    );
  }
}
