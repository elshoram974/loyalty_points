import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';

class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({super.key, required this.date});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingSmall,
      ),
      alignment: AlignmentDirectional.centerStart,
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppConst.paddingSmall),
      decoration: const BoxDecoration(
        color: AppColor.greyBackground,
        border: Border(
          bottom: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
      width: double.infinity,
      height: 40,
      child: Text(
        intl.DateFormat.yMMMd(
          Get.find<ConfigController>().locale.languageCode,
        ).format(date),
        style: context.textTheme.titleLarge?.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
