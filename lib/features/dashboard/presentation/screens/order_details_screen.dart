import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/my_network_image.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../domain/entity/order_entity.dart';
import '../widgets/date_container_widget.dart';

class OrdersDetailsScreen extends StatelessWidget {
  const OrdersDetailsScreen({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).order_details,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          DateContainerWidget(date: order.date),
          _DetailsCard(
            icon: order.orderStatus.icon,
            title: localeLang(context).status,
            value: order.orderStatus.name,
            valueColor: order.orderStatus.color,
          ),
          _DetailsCard(
            icon: Icons.star_outline,
            title: localeLang(context).points,
            value: order.points.withSeparator,
          ),
          _DetailsCard(
            icon: Icons.price_check_outlined,
            title: localeLang(context).price,
            value: order.price.withSeparator,
          ),
          _DetailsCard(
            icon: Icons.phone_outlined,
            title: localeLang(context).mobileNumber,
            value: order.phone.toString(),
          ),
          _DetailsCard(
            icon: Icons.payment_outlined,
            title: localeLang(context).paymentMethod,
            value: order.paymentMethod?.name ?? '',
          ),
          const SizedBox(height: 16),
          Text(
            localeLang(context).image_for_order,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: MyNetworkImage(order.imageUrl),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  const _DetailsCard({
    required this.title,
    required this.value,
    this.valueColor,
    this.icon,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: icon != null
            ? Icon(icon, color: valueColor ?? Theme.of(context).primaryColor)
            : null,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            color: valueColor ?? Theme.of(context).textTheme.bodyMedium?.color,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
