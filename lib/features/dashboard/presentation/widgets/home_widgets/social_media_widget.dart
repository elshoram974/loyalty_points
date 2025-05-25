import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/functions/handle_url.dart';

import '../../../../../app_info.dart';
import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/types/social_media_type.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
        id: AppString.updateHomeSocial,
        builder: (controller) {
          final List<SocialMediaType> items = List.unmodifiable(
            AppInfo.config?.socialMedia ?? [],
          );
          if (items.isEmpty) return const SizedBox();
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppConst.paddingDefault,
              horizontal: AppConst.paddingDefault,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                items.length,
                (index) => GestureDetector(
                  onTap: () => launchURL(items[index].url),
                  child: Icon(items[index].icon, size: 35),
                ),
              ),
            ),
          );
        });
  }
}
