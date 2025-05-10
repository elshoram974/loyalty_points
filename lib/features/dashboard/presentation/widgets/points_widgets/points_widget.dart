import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/date_container_widget.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entity/points_entity.dart';

class PointssWidget extends StatelessWidget {
  const PointssWidget({super.key, required this.points});
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
                      points.orderStatus!.name,
                      style: context.textTheme.labelLarge?.copyWith(
                        color: points.orderStatus == PointsStatusEnum.earned
                            ? Colors.green
                            : points.orderStatus == PointsStatusEnum.replaced
                                ? const Color.fromARGB(255, 239, 173, 67)
                                : Colors.red,
                      ),
                    ),
                  Text(
                    '${points.orderNumber}',
                    style: context.textTheme.labelLarge?.copyWith(
                        color: const Color.fromARGB(255, 136, 131, 131)),
                  ),
                ],
              ),
              Text(
                ' ${points.points} ',
                style: context.textTheme.labelLarge
                    ?.copyWith(color: context.theme.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
