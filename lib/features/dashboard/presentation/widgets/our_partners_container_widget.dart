import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';

class OurPartnersWidget extends StatelessWidget {
  const OurPartnersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingDefault,
          vertical: AppConst.paddingSmall),
      decoration: const BoxDecoration(
        color: AppColor.greyBackground,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 1.0),
        ),
      ),
      width: double.infinity,
      height: 40,
      child: Padding(
        padding: const EdgeInsetsDirectional.all(AppConst.paddingSmall),
        child: Row(
          children: [
            Text(
              localeLang(context).ourPartners,
              style: context.textTheme.titleLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}