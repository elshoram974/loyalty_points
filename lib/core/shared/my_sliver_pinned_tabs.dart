import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants/app_color.dart';
import '../utils/constants/app_constants.dart';

class MySliverPinnedTaps extends StatelessWidget {
  const MySliverPinnedTaps({super.key, required this.tabs});
  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _TabWidget(tabs: tabs),
      pinned: true,
    );
  }
}

class _TabWidget extends SliverPersistentHeaderDelegate {
  final List<Widget> tabs;

  const _TabWidget({required this.tabs});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    if (tabs.isEmpty) return const SizedBox();
    bool inTop = shrinkOffset != 0;
    return Container(
        padding: const EdgeInsets.only(bottom: AppConst.paddingSmall),
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
            if (tabs.length > 1)
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
              splashFactory: tabs.length > 1 ? null : NoSplash.splashFactory,
              indicatorSize: tabs.length > 1
                  ? TabBarIndicatorSize.tab
                  : TabBarIndicatorSize.label,
              indicatorWeight: AppConst.borderDefaultWidth,
              padding: const EdgeInsets.symmetric(
                horizontal: AppConst.paddingDefault,
              ),
              splashBorderRadius: BorderRadius.circular(
                AppConst.radiusDefault,
              ),
              indicator: UnderlineTabIndicator(
                borderRadius: BorderRadius.circular(AppConst.radiusDefault),
                borderSide: BorderSide(
                  width: AppConst.borderDefaultWidth,
                  color: context.theme.primaryColor,
                ),
                // color: context.theme.primaryColor
              ),
              tabs: tabs,
            ),
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
