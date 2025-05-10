import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_color.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/points_entity.dart';
import '../widgets/our_partners_container_widget.dart';
import '../widgets/points_widgets/points_widget.dart';

class PointssScreen extends StatelessWidget {
  const PointssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return const [
              SliverToBoxAdapter(child: PointsBalanceWidget()),
              SliverToBoxAdapter(child: OurPartnersWidget()),
              SliverPersistentHeader(
                delegate: TapWidget(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              ListView.separated(
                addRepaintBoundaries: false,
                itemCount: _points.length,
                itemBuilder: (context, index) {
                  return PointssWidget(points: _points[index]);
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(AppConst.paddingDefault).copyWith(bottom: 0),
                    child: const Divider(thickness: 0.5),
                  );
                },
              ),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}

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

class TapWidget extends SliverPersistentHeaderDelegate {
  const TapWidget();
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    bool inTop = shrinkOffset != 0;
    return Container(
      padding: EdgeInsets.only(bottom: AppConst.paddingSmall),
        decoration: inTop
            ? const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ],
              )
            : null,
        child: Stack(
          children: [
            Positioned(
              left: AppConst.paddingDefault,
              bottom: 0,
              right: AppConst.paddingDefault,
              child: Container(
                height: AppConst.borderDefaultWidth,
                decoration: BoxDecoration(
                  color: AppColor.greyBackground,
                  borderRadius: BorderRadius.circular(AppConst.radiusDefault),
                ),
              ),
            ),
            TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: AppColor.greyBackground,
                indicatorColor: context.theme.primaryColor,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: AppConst.borderDefaultWidth,
                padding:
                    EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
                splashBorderRadius:
                    BorderRadius.circular(AppConst.radiusDefault),
                indicator: UnderlineTabIndicator(
                  borderRadius: BorderRadius.circular(AppConst.radiusDefault),
                  borderSide: BorderSide(
                    width: AppConst.borderDefaultWidth,
                    color: context.theme.primaryColor,
                  ),
                  // color: context.theme.primaryColor
                ),
                tabs: [
                  Tab(
                    text: localeLang(context).pointsHistory,
                  ),
                  Tab(
                    text: "Text",
                  ),
                ]),
          ],
        ));
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => maxExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
