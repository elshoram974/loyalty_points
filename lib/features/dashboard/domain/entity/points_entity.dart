import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

class PointsEntity extends Equatable {
  final PointsStatusEnum? orderStatus;
  final double points;
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
  earned,
  replaced,
  canceled;

  Color get color {
    switch (this) {
      case PointsStatusEnum.earned:
        return Colors.green;
      case PointsStatusEnum.replaced:
        return const Color.from(
            alpha: 1, red: 0.937, green: 0.678, blue: 0.263);
      case PointsStatusEnum.canceled:
        return Colors.red;
    }
  }

  String localeName(BuildContext context) {
    switch (this) {
      case PointsStatusEnum.earned:
        return localeLang(context).earned;
      case PointsStatusEnum.replaced:
        return localeLang(context).replaced;
      case PointsStatusEnum.canceled:
        return localeLang(context).canceled;
    }
  }
}
