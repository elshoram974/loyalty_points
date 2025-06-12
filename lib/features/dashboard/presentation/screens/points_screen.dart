import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_loading.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/types/points_status_enum.dart';
import '../../domain/entity/points_entity.dart';
import '../controller/dashboard_controller.dart';
import '../controller/points_controller.dart';
import '../widgets/my_custom_divider.dart';
import '../widgets/our_partners_container_widget.dart';
import '../widgets/points_widgets/points_widget.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PointsController pointsController = Get.find<PointsController>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      pointsController.getPoints();
    });

    return DefaultTabController(
      length: 1,
      child: CustomScaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            await Future.wait([
              pointsController.getPoints(true),
              Get.find<DashboardController>().getAllData(true),
            ]);
          },
          notificationPredicate: (notification) => notification.depth == 1,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverToBoxAdapter(
                  child: PointsBalanceWidget(isUncategorized: false),
                ),
                const SliverToBoxAdapter(child: OurPartnersWidget()),
                MySliverPinnedTaps(
                  tabs: [
                    Tab(text: localeLang(context).pointsHistory),
                  ],
                ),
              ];
            },
            body: GetBuilder<PointsController>(
              builder: (c) {
                final List<PointsEntity> points = [];
                if (c.isInitialLoading) {
                  points.addAll(_points);
                } else {
                  points.addAll(c.points);
                }

                return NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    if (notification.metrics.pixels >=
                            0.7 * notification.metrics.maxScrollExtent &&
                        !c.isLoadingMore) {
                      c.getMorePoints();
                    }
                    return false;
                  },
                  child: CustomScrollView(
                    slivers: [
                      if (c.points.isEmpty && !c.isInitialLoading)
                        SliverFillRemaining(
                          child: Center(
                            child: Text(localeLang(context).noData),
                          ),
                        )
                      else ...[
                        SliverList.separated(
                          addRepaintBoundaries: false,
                          itemCount: points.length,
                          separatorBuilder: (_, i) => const MyCustomDivider(),
                          itemBuilder: (_, i) => CustomLoadingWidget(
                            isLoading: c.isInitialLoading,
                            child: PointsWidget(points: points[i]),
                          ),
                        ),
                        if (c.hasMoreItem)
                          SliverList(
                            delegate: SliverChildListDelegate([
                              const SizedBox(height: AppConst.paddingDefault),
                              CustomLoadingWidget(
                                isLoading: true,
                                child: PointsWidget(points: points[0]),
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

List<PointsEntity> get _points => [
      PointsEntity(
        orderStatus: PointsStatusEnum.add,
        points: 540,
        orderNumber: 2222221400,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.add,
        points: 300,
        orderNumber: 22222223001,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.add,
        points: 540,
        orderNumber: 2222221400,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000,
        date: DateTime.now(),
      ),
    ];
