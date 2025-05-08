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
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingDefault,
              vertical: AppConst.paddingDefault),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.greyBackground,
            ),
            width: double.infinity,
            height: 40,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(3),
              child: Text(
                intl.DateFormat.yMMMd(
                  Get.find<ConfigController>().locale.languageCode,
                ).format(order.date),
                style: context.textTheme.headlineSmall
                    ?.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: RichText(
            text: TextSpan(
                style:
                    context.textTheme.labelLarge?.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: order.orderStatus.name,
                  ),
                  TextSpan(
                    text: ' ${order.points} ',
                  ),
                  TextSpan(
                    text: '${order.price}',
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
