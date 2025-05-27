import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/points_entity.dart';
import '../widgets/our_partners_container_widget.dart';
import '../widgets/points_widgets/points_widget.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverToBoxAdapter(
                child: PointsBalanceWidget(
                  description: 'bnnb',
                  isUncategorized: false,
                ),
              ),
              const SliverToBoxAdapter(child: OurPartnersWidget()),
              MySliverPinnedTaps(
                tabs: [
                  Tab(
                    text: localeLang(context).pointsHistory,
                  ),
                  Tab(
                    text: localeLang(context).couponsHistory,
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                addRepaintBoundaries: false,
                itemCount: _points.length,
                itemBuilder: (context, index) {
                  return PointsWidget(points: _points[index]);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppConst.paddingDefault)
                        .copyWith(bottom: 0),
                    child: const Divider(thickness: 0.5),
                  );
                },
              ),
              ListView.separated(
                addRepaintBoundaries: false,
                itemCount: _coupons.length,
                itemBuilder: (_, i) => PointsWidget(points: _coupons[i]),
                separatorBuilder: (_, __) {
                  return Padding(
                    padding: const EdgeInsets.all(
                      AppConst.paddingDefault,
                    ).copyWith(bottom: 0),
                    child: const Divider(thickness: 0.5),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PointsEntity> get _coupons => [
      PointsEntity(
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.canceled,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
    ];
List<PointsEntity> get _points => [
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.replaced,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.earned,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
    ];
