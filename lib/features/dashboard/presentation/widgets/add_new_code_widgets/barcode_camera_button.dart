import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/responsive_ex.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../controller/add_new_code_controller.dart';

class BarCodeCameraButton extends GetView<AddNewCodeController> {
  const BarCodeCameraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: context.isTabletWidth ? AppConst.radiusBig : 0,
      onTap: () async {
        final result = await Get.toNamed(AppRoute.barCodeScanner);
        if (result is String) {
          controller.textController.text = result;
          controller.update();
        }
      },
      borderRadius: BorderRadius.circular(AppConst.radiusSmall),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppConst.paddingSmall,
          horizontal: AppConst.paddingDefault,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                localeLang(context).pressToUseCamera,
                style: context.textTheme.titleMedium,
              ),
            ),
            CircleAvatar(
              backgroundColor: AppColor.greyBackground,
              radius: 30,
              child: Image.asset(AppAssets.findBarCode),
            ),
          ],
        ),
      ),
    );
  }
}
