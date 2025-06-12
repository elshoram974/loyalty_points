import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/date_container_widget.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_color.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entity/points_entity.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key, required this.points});
  final PointsEntity points;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppConst.paddingSmall,
        bottom: AppConst.paddingBig,
      ),
      child: Column(
        children: [
          DateContainerWidget(date: points.date),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingBig,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      points.orderStatus.name,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: points.orderStatus.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (points.orderNumber != null)
                      Text(
                        '${points.orderNumber}',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: AppColor.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
                Text(
                  localeLang(context).point_number(points.points.withSeparator),
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: context.theme.primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
