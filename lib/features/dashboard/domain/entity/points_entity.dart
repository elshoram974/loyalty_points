import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

class PointsEntity extends Equatable {
  final PointsStatusEnum? orderStatus;
  final int points;
  final double orderNumber;
  final DateTime date;

  const PointsEntity({
    this.orderStatus,
    required this.points,
    required this.orderNumber,
    required this.date,
  });

  @override
  List<Object?> get props => [orderStatus, points, orderNumber, date];
}

enum PointsStatusEnum {
  discount,
  addition;
  Color get color {
    switch (this) {
      case PointsStatusEnum.addition:
        return Colors.green;
      case PointsStatusEnum.discount:
        return const Color.from(
            alpha: 1, red: 0.937, green: 0.678, blue: 0.263);
      // case PointsStatusEnum.canceled:
      //   return Colors.red;
    }
  }

  String localeName(BuildContext context) {
    switch (this) {
      case PointsStatusEnum.discount:
        return localeLang(context).discount;
      case PointsStatusEnum.addition:
        return localeLang(context).addition;

    }
  }
}
