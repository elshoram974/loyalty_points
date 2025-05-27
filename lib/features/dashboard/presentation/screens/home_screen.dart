import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/shared/custom_carousel_slider.dart';
import '../../../../core/shared/custom_loading.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../widgets/home_widgets/abusing_code.dart';
import '../widgets/home_widgets/social_media_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
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
        const SocialMediaWidget(),
        PointsBalanceWidget(description: localeLang(context).transferablePointsBalance),
        const AbusingCode()
      ],
    );
  }
}
