import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/num_ex.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/controller/config_controller.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import 'package:intl/intl.dart' as intl;

import '../../domain/entity/points_entity.dart';

class PointsDetailsScreen extends StatelessWidget {
  const PointsDetailsScreen({super.key,required this.points});
  final PointsEntity points;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          localeLang(context).pointsDetails,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          
          _DetailsCard(
            icon: Icons.calendar_month_outlined,
            title: localeLang(context).date,
            value: intl.DateFormat.yMMMd(
              Get.find<ConfigController>().locale.languageCode,
            ).format(DateTime(
              points.date.year,
            )),
          ),
          _DetailsCard(
             icon: points.orderStatus.icon,
            title: localeLang(context).status,
            value: points.orderStatus.name,
             valueColor: points.orderStatus.color,
          ),
          _DetailsCard(
            icon: Icons.star_outline,
            title: localeLang(context).points,
            value:points.points.withSeparator,
          ),
          _DetailsCard(
            icon: Icons.numbers,
            title: localeLang(context).accepted,
            value:points.orderNumber.toString(),
          ),
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
    this.valueDirection,
  });

  final String title;
  final String value;
  final Color? valueColor;
  final IconData? icon;
  final TextDirection? valueDirection;

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
        subtitle: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            value,
            textDirection: valueDirection,
            style: TextStyle(
              color:
                  valueColor ?? Theme.of(context).textTheme.bodyMedium?.color,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
