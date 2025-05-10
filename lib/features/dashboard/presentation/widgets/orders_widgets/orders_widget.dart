import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/date_container_widget.dart';
import '../../../domain/entity/order_entity.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DateContainerWidget(date: order.date),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              order.orderStatus.name,
              style: context.textTheme.labelLarge?.copyWith(color: Colors.grey),
            ),
            Text(
              ' ${order.points} ',
              style: context.textTheme.labelLarge
                  ?.copyWith(color: context.theme.primaryColor),
            ),
            Text(
              '${order.price}',
              style: context.textTheme.labelLarge
                  ?.copyWith(color: context.theme.primaryColor),
            ),
          ],
        ),
      ],
    );
  }
}

