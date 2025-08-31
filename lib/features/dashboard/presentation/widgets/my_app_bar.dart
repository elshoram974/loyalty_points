import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/string_ex.dart';

import '../../../../core/shared/custom_loading.dart';
import '../../../../core/shared/my_network_image.dart';
import '../../../../core/shared/responsive/constrained_box.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../controller/dashboard_controller.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault)
            .copyWith(bottom: AppConst.paddingDefault),
        child: MyResConstrainedBoxAlign(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GetBuilder<DashboardController>(
                id: AppString.updateHomeUser,
                builder: (controller) {
                  final String name = controller.user?.name ?? '';
                  return CustomLoadingWidget(
                    isLoading: controller.isLoadingUserData,
                    child: GestureDetector(
                      onTap: controller.user == null
                          ? null
                          : () => Get.toNamed(AppRoute.profileDetails),
                      child: Row(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Hero(
                              tag: controller.user?.image?.path ?? 'user image',
                              child: ClipOval(
                                child: MyNetworkImage(
                                  controller.user?.image?.path,
                                  placeHolder: UserImagePlaceHolder(name: name),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: AppConst.paddingSmall),
                          RichText(
                            text: TextSpan(
                              style: context.textTheme.bodyMedium,
                              children: [
                                TextSpan(
                                    text: localeLang(context).welcomeToYou),
                                const TextSpan(text: "\n"),
                                TextSpan(text: name),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              // Image.asset(AppAssets.businessLogo),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class UserImagePlaceHolder extends StatelessWidget {
  const UserImagePlaceHolder({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: double.maxFinite,
      backgroundColor: AppColor.greyBackground,
      child: FittedBox(
        child: Text(
          name.nameAbbreviation,
          style: context.textTheme.headlineLarge,
        ),
      ),
    );
  }
}
