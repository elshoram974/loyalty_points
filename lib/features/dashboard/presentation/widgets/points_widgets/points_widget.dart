import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_assets.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import '../../../../../core/shared/points_builder_widget.dart';
import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import 'package:intl/intl.dart' as intl;

class PointsAndOrdersWidget extends StatelessWidget {
  const PointsAndOrdersWidget({
    super.key,
    required this.text,
    required this.points,
    required this.createdDate,
    required this.color,
    this.price,
    this.onTap,
  });
  final Color color;
  final String text;
  final int points;
  final double? price;
  final DateTime createdDate;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingDefault,
          vertical: AppConst.paddingExtraSmall,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.paddingDefault,
            vertical: AppConst.paddingSmall,
          ),
          child: Row(
            spacing: AppConst.paddingSmall,
            children: [
              Image.asset(
                AppAssets.points,
                height: 60,
                width: 60,
              ),
              Expanded(
                child: Row(
                  spacing: AppConst.paddingSmall,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Text(
                        text,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (price != null)
                      Expanded(
                        flex: 4,
                        child: PointsBuilderWidget(
                          builder: (_, __, helper) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  right: AppConst.paddingSmall),
                              child: Text(
                                '${price!.withSeparator} ${helper.config?.currency}',
                                textAlign: TextAlign.center,
                                style: context.textTheme.labelLarge?.copyWith(
                                    color: context.theme.primaryColor),
                              ),
                            );
                          },
                        ),
                      )
                    else
                      const Spacer(),
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            localeLang(context)
                                .point_number(points.withSeparator),
                            textAlign: TextAlign.center,
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: context.theme.primaryColor),
                          ),
                          Text(
                            intl.DateFormat.yMMMd(
                              Get.find<ConfigController>().locale.languageCode,
                            ).format(createdDate),
                            textAlign: TextAlign.center,
                            style: context.textTheme.labelLarge
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.only(
    //     top: AppConst.paddingSmall,
    //     bottom: AppConst.paddingBig,
    //   ),
    //   child: Column(
    //     children: [
    //       DateContainerWidget(date: points.date),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(
    //           horizontal: AppConst.paddingBig,
    //         ),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Text(
    //                   points.orderStatus.name,
    //                   style: context.textTheme.labelLarge?.copyWith(
    //                     color: points.orderStatus.color,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 if (points.orderNumber != null)
    //                   Text(
    //                     '${points.orderNumber}',
    //                     style: context.textTheme.labelLarge?.copyWith(
    //                       color: AppColor.grey,
    //                     ),
    //                     textAlign: TextAlign.center,
    //                   ),
    //               ],
    //             ),
    //             Text(
    //               localeLang(context).point_number(points.points.withSeparator),
    //               style: context.textTheme.labelLarge
    //                   ?.copyWith(color: context.theme.primaryColor),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
