import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/types/payment_methods.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/order_entity.dart';
import '../widgets/my_custom_divider.dart';
import '../widgets/orders_widgets/orders_widget.dart';
import '../widgets/our_partners_container_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: DefaultTabController(
        length: 1,
        child: CustomScrollView( 
          slivers: [
            const SliverToBoxAdapter(
              child: PointsBalanceWidget(isUncategorized: false),
            ),
            const SliverToBoxAdapter(child: OurPartnersWidget()),
            MySliverPinnedTaps(tabs: [Tab(text: localeLang(context).orders)]),
            SliverList.separated(
              addRepaintBoundaries: false,
              itemCount: _orders.length,
              itemBuilder: (_, i) => OrdersWidget(order: _orders[i]),
              separatorBuilder: (_, i) => const MyCustomDivider(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppConst.paddingBig),
            ),
          ],
        ),
      ),
    );
  }
}



List<OrderEntity> get _orders => [
      OrderEntity(
        orderStatus: OrderStatusEnum.rejected,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.rejected,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.accepted,
        points: 540,
        price: 1400.25,
        date: DateTime(2002),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '0123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl:
            'https://onlinecheckwriter.com/wp-content/uploads/2024/03/online-payment.jpg',
      ),
    ];
