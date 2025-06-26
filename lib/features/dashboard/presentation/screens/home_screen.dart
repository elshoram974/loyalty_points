import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/custom_carousel_slider.dart';
import '../../../../core/shared/custom_loading.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../controller/dashboard_controller.dart';
import '../widgets/home_widgets/abusing_code.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Get.find<DashboardController>().getAllData(true),
      child: ListView(
        children: [
          GetBuilder<ConfigController>(
            id: AppString.updateHomeBanners,
            builder: (controller) {
              return CustomLoadingWidget(
                isLoading: controller.isLoadingConfig,
                child: CustomCarouselSlider(
                  images: controller.isLoadingConfig
                      ? ['', '']
                      : AppInfo.config?.homeBanners ?? [],
                ),
              );
            },
          ),
          const PointsBalanceWidget(),
          const AbusingCode()
        ],
      ),
    );
  }
}
