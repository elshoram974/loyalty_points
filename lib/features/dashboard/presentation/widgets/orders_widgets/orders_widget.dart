import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      ' ${order.points} ',
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
                Text(
                  '${order.price}',
                  style: context.textTheme.labelLarge
                      ?.copyWith(color: context.theme.primaryColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
