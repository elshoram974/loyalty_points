import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import 'package:loyalty_points/core/utils/extensions/responsive_ex.dart';
import '../../../../../core/shared/points_builder_widget.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../domain/entity/order_entity.dart';
import '../../screens/order_details_screen.dart';
import '../date_container_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: context.isTabletWidth
          ? BorderRadius.circular(AppConst.radiusDefault)
          : null,
      onTap: () => Get.to(() => OrdersDetailsScreen(order: order)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppConst.paddingDefault),
        child: Column(
          children: [
            DateContainerWidget(date: order.date),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  order.orderStatus.name,
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: order.orderStatus.color),
                ),
                Row(
                  children: [
                    Text(
                      ' ${order.points.withSeparator} ',
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
                PointsBuilderWidget(
                  builder: (_,__,helper){
                  return Text(
                    '${order.price.withSeparator} ${helper.config?.currency}',
                    style: context.textTheme.labelLarge
                        ?.copyWith(color: context.theme.primaryColor),
                  );
                  }
                ),
  
              ],
            ),
          ],
        ),
      ),
    );
  }
}
