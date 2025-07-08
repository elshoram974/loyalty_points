import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import '../../../../../app_info.dart';
import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/functions/handle_url.dart';

class AbusingCode extends StatelessWidget {
  const AbusingCode({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      id: AppString.updateHomeBurnSteps,
      builder: (_) {
        if (AppInfo.config?.burnStepsHTML?.isNotEmpty != true) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.all(AppConst.paddingDefault),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localeLang(context).howToAbusingCode,
                style: context.textTheme.headlineSmall,
              ),
              Html(
                data: AppInfo.config!.burnStepsHTML!,
                onLinkTap: (url, attributes, element) {
                  if (url != null) launchURL(url);
                },
              ),
              const SizedBox(height: AppConst.paddingExtraBig),
            ],
          ),
        );
      },
    );
  }
}
