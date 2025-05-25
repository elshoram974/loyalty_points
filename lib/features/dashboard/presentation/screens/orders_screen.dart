import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/order_entity.dart';
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
              const SliverToBoxAdapter(child: PointsBalanceWidget(pointsBalance: 5000,description: 'bnnb', isUncategorized: false,),),
            const SliverToBoxAdapter(child: OurPartnersWidget()),
            MySliverPinnedTaps(tabs: [Tab(text: localeLang(context).orders)]),
            // SliverToBoxAdapter(
            //     child: Padding(
            //   padding: const EdgeInsets.only(top: AppConst.paddingDefault),
            //   child: Text(
            //       textAlign: TextAlign.center,
            //       localeLang(context).orders,
            //       style: context.textTheme.headlineSmall?.copyWith(
            //         color: Colors.black,
            //         fontWeight: FontWeight.w500,
            //       )),
            // )),
            // SliverToBoxAdapter(
            //   child: Center(
            //     child: Container(
            //       width: 150,
            //      // margin: const EdgeInsets.symmetric(horizontal: 120),
            //       height: 5,
            //       decoration: BoxDecoration(
            //           color: context.theme.primaryColor,
            //           borderRadius: BorderRadius.circular(10)),
            //     ),
            //   ),
            // ),
            SliverList.separated(
              addRepaintBoundaries: false,
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                return OrdersWidget(order: _orders[index]);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(
                      top: AppConst.paddingBig,
                      left: AppConst.paddingBig,
                      right: AppConst.paddingBig),
                  child: Divider(thickness: 0.5),
                );
              },
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
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 100,
        price: 1000.25,
        date: DateTime.now(),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.accepted,
        points: 300,
        price: 3001.25,
        date: DateTime(2001),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.rejected,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 100,
        price: 1000.25,
        date: DateTime.now(),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.accepted,
        points: 300,
        price: 3001.25,
        date: DateTime(2001),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.rejected,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 100,
        price: 1000.25,
        date: DateTime.now(),
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.accepted,
        points: 300,
        price: 3001.25,
        date: DateTime(2001),
      ),
    ];
