import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_color.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class CancelAndConfirmButtons extends StatelessWidget {
  const CancelAndConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppConst.paddingExtraBig,
          horizontal: AppConst.paddingDefault),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(AppConst.radiusDefault),
                  ),
                ),
                backgroundColor: Colors.grey,
              ),
              child: Text(
                localeLang(context).cancel,
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(width: AppConst.paddingDefault),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(AppConst.radiusDefault),
                    ),
                  ),
                  backgroundColor: context.theme.primaryColor),
              child: Text(
                localeLang(context).confirm,
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
