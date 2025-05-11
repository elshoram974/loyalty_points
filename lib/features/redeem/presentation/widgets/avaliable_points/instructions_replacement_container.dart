import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class ContainerForReplacement extends StatelessWidget {
  const ContainerForReplacement({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.greyBackground,
        borderRadius: BorderRadius.circular(AppConst.radiusDefault),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingDefault,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingDefault,
      ),
      child: Text(text,
      textAlign: TextAlign.center,
          style: context.textTheme.titleLarge
              ?.copyWith(fontWeight: FontWeight.bold)),
    );
  }
}

         
