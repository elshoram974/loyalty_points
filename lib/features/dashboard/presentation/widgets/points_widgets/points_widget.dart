import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/date_container_widget.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entity/points_entity.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key, required this.points});
  final PointsEntity points;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateContainerWidget(date: points.date),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConst.paddingBig),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  if (points.orderStatus != null)
                    Text(
                      points.orderStatus!.localeName(context),
                      style: context.textTheme.labelLarge?.copyWith(
                        color: points.orderStatus!.color,
                      ),
                    ),
                  Text(
                    '${points.orderNumber}',
                    style: context.textTheme.labelLarge?.copyWith(
                        color: const Color.fromARGB(255, 136, 131, 131)),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    ' ${points.points.withSeparator} ',
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: context.theme.primaryColor),
                  ),
                  Text(
                    localeLang(context).point,
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: context.theme.primaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
