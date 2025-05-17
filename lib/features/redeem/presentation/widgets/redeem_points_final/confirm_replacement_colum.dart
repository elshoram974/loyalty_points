import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class ConfirmReplacement extends StatelessWidget {
  const ConfirmReplacement({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingExtraBig,
          vertical: AppConst.paddingSmall),
      child: Text(
        localeLang(context).replacepointswithpounds('100', '5000'),
        style: context.textTheme.titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    ),
    Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.paddingExtraBig,
                  vertical: AppConst.paddingSmall),
              child: Text(
                localeLang(context).attend,
                style: context.textTheme.titleSmall
                    ?.copyWith(color: const Color.fromARGB(255, 97, 95, 95)),
              ),
            ),
    ],);
  }
}