import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:loyalty_points/core/utils/constants/app_color.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../../core/utils/config/controller/config_controller.dart';
import '../../../domain/entity/order_entity.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingDefault,
              vertical: AppConst.paddingSmall),
          decoration:const BoxDecoration(
            color: AppColor.greyBackground,
            border:  Border(
              bottom: BorderSide(
                color: Colors.black, // لون الخط
                width: 1.0, // سمك الخط
              ),
            ),
          ),
          width: double.infinity,
          height: 40,
          child: Padding(
            padding: const EdgeInsetsDirectional.all(5),
            child: Text(
              intl.DateFormat.yMMMd(
                Get.find<ConfigController>().locale.languageCode,
              ).format(order.date),
              style:
                  context.textTheme.titleLarge?.copyWith(color: Colors.black),
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              order.orderStatus.name,
              style: context.textTheme.labelLarge?.copyWith(color: Colors.grey),
            ),
            Text(
              ' ${order.points} ',
              style: context.textTheme.labelLarge?.copyWith(color: Colors.red),
            ),
            Text(
              '${order.price}',
              style: context.textTheme.labelLarge?.copyWith(color: Colors.red),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppConst.paddingBig),
          child: Divider(thickness: 0.5),
        ),
        // RichText(
        //   text: TextSpan(
        //       style:
        //           context.textTheme.labelLarge?.copyWith(color: Colors.black),
        //       children: [
        //         TextSpan(
        //          text: order.orderStatus.name,
        //         ),
        //         TextSpan(
        //           text: ' ${order.points} ',
        //            style: context.textTheme.labelLarge
        //               ?.copyWith(color: Colors.red),
        //         ),
        //         TextSpan(
        //           text: '${order.price}',
        //           style: context.textTheme.labelLarge
        //               ?.copyWith(color: Colors.red),
        //         ),
        //       ]),
        // ),
      ],
    );
  }
}
