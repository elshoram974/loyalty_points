import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_loading.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/types/order_status_enum.dart';
import '../../../../core/utils/types/payment_methods.dart';
import '../../domain/entity/order_entity.dart';
import '../controller/dashboard_controller.dart';
import '../controller/orders_controller.dart';
import '../widgets/my_custom_divider.dart';
import '../widgets/orders_widgets/orders_widget.dart';
import '../widgets/our_partners_container_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrdersController ordersController = Get.find<OrdersController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ordersController.getOrders();
    });

    return DefaultTabController(
      length: 1,
      child: CustomScaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              ordersController.getOrders(true),
              Get.find<DashboardController>().getAllData(true),
            ]);
          },
          notificationPredicate: (notification) => notification.depth == 1,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // const SliverToBoxAdapter(
                //   child: PointsBalanceWidget(isUncategorized: false),
                // ),
                const SliverToBoxAdapter(child: OurPartnersWidget()),
                MySliverPinnedTaps(
                  tabs: [Tab(text: localeLang(context).orders)],
                ),
              ];
            },
            body: GetBuilder<OrdersController>(
              builder: (c) {
                final List<OrderEntity> orders = [];
                if (c.isInitialLoading) {
                  orders.addAll(_orders);
                } else {
                  orders.addAll(c.orders);
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels >=
                            0.7 * notification.metrics.maxScrollExtent &&
                        !c.isLoadingMore) {
                      c.getMoreOrders();
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    slivers: [
                      if (c.orders.isEmpty && !c.isInitialLoading)
                        SliverFillRemaining(
                          child: Center(
                            child: Text(localeLang(context).noData),
                          ),
                        )
                      else ...[
                        SliverList.separated(
                          addRepaintBoundaries: false,
                          itemCount: orders.length,
                          separatorBuilder: (_, i) => const MyCustomDivider(),
                          itemBuilder: (_, i) => CustomLoadingWidget(
                            isLoading: c.isInitialLoading,
                            child: OrdersWidget(order: orders[i]),
                          ),
                        ),
                        if (c.hasMoreItem)
                          SliverList(
                            delegate: SliverChildListDelegate([
                              const SizedBox(height: AppConst.paddingDefault),
                              CustomLoadingWidget(
                                isLoading: true,
                                child: OrdersWidget(order: orders[0]),
                              )
                            ]),
                          ),
                        const SliverToBoxAdapter(
                          child: SizedBox(height: AppConst.paddingBig),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
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
        phone: '+20123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl: null,
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.rejected,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '+20123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl: null,
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.accepted,
        points: 540,
        price: 1400.25,
        date: DateTime(2002),
        phone: '+20123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl: null,
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '+20123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl: null,
      ),
      OrderEntity(
        orderStatus: OrderStatusEnum.pending,
        points: 540,
        price: 1400.25,
        date: DateTime(2000),
        phone: '+20123456789',
        paymentMethod: PaymentMethod.wallet,
        imageUrl: null,
      ),
    ];
