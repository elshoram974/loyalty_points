import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import 'package:loyalty_points/features/dashboard/domain/entity/avaliable_points_entity.dart';

import '../../../../../core/utils/constants/app_constants.dart';

class AvaliablePointsContainer extends StatelessWidget {
  const AvaliablePointsContainer({super.key, required this.avaliablepoints});
  final AvaliablePointsEntity avaliablepoints;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingSmall,
      ),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConst.radiusDefault),
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 0.7,
        ),
      ),
      child: Text(
        '${avaliablepoints.points.withSeparator} ${localeLang(context).point} = ${avaliablepoints.pounds.withSeparator} ${localeLang(context).pound}',
        style: context.textTheme.titleMedium
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
