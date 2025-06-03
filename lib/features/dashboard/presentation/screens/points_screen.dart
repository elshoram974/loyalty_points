import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_sliver_pinned_tabs.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/points_entity.dart';
import '../widgets/my_custom_divider.dart';
import '../widgets/our_partners_container_widget.dart';
import '../widgets/points_widgets/points_widget.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: CustomScaffold(
        body: NestedScrollView(
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
          body: TabBarView(
            children: [
              ListView.separated(
                addRepaintBoundaries: false,
                itemCount: _points.length,
                padding: const EdgeInsets.only(bottom: AppConst.paddingBig),
                itemBuilder: (context, i) => PointsWidget(points: _points[i]),
                separatorBuilder: (_, i) => const MyCustomDivider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PointsEntity> get _points => [
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 540,
        orderNumber: 2222221400.25,
        date: DateTime(2000),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.discount,
        points: 100,
        orderNumber: 2222221000.25,
        date: DateTime.now(),
      ),
      PointsEntity(
        orderStatus: PointsStatusEnum.addition,
        points: 300,
        orderNumber: 22222223001.25,
        date: DateTime(2001),
      ),
    ];
