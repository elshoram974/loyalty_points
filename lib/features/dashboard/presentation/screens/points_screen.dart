import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../domain/entity/points_entity.dart';
import '../widgets/orders_widgets/orders_widget.dart';
import '../widgets/points_widgets/points_widget.dart';

class PointssScreen extends StatelessWidget {
  const PointssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: PointsBalanceWidget()),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: AppConst.paddingDefault,
                  vertical: AppConst.paddingSmall),
              decoration: const BoxDecoration(
                color: AppColor.greyBackground,
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1.0),
                ),
              ),
              width: double.infinity,
              height: 40,
              child: Padding(
                padding: const EdgeInsetsDirectional.all(AppConst.paddingSmall),
                child: Row(
                  children: [
                    Text(localeLang(context).ourPartners,
                        style: context.textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        )),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: const EdgeInsets.only(top: AppConst.paddingDefault),
            child: Text(
                textAlign: TextAlign.center,
                localeLang(context).pointsHistory,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                )),
          )),
          SliverToBoxAdapter(
            child: Center(
              child: Container(
                width: 150,
               // margin: const EdgeInsets.symmetric(horizontal: 120),
                height: 5,
                decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SliverList.separated(
            addRepaintBoundaries: false,
            itemCount: _points.length,
            itemBuilder: (context, index) {
              return PointssWidget(points: _points[index]);
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


    ];
