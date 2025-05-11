import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import 'package:loyalty_points/features/dashboard/domain/entity/avaliable_points_entity.dart';

import '../../../../../core/utils/constants/app_constants.dart';

class AvaliablePointsContainer extends StatelessWidget {
  const AvaliablePointsContainer({
    super.key,
    required this.avaliablepoints,
    required this.isSelected,
  });
  final AvaliablePointsEntity avaliablepoints;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      margin: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingDefault,
        vertical: AppConst.paddingSmall,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConst.radiusSmall),
        color: isSelected ? context.theme.primaryColor : Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            spreadRadius: 0.5,
          ),
        ],
      ),
      duration: AppConst.animationsDefault,
      child: Text(
        localeLang(context).pointsEqualEgyptionPounds(
          avaliablepoints.points.withSeparator,
          avaliablepoints.pounds.withSeparator,
        ),
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
