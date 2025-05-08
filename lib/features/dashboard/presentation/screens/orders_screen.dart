import 'package:flutter/material.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../domain/entity/order_entity.dart';
import '../widgets/home_widgets/orders_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          const PointsBalanceWidget(),
          ...List.generate(
            _orders.length,
            (index) {
              return OrdersWidget(
                order: _orders[index],
              );
            },
          ),
        ],
      ),
    );
  }
}

List<OrderEntity> get _orders => [
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 100,
        price: 1000.25,
        date: DateTime.now(),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 300,
        price: 3001.25,
        date: DateTime(2001),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
      ),
    ];
