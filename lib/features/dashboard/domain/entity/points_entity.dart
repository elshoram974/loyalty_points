import 'package:equatable/equatable.dart';

class PointsEntity extends Equatable {
  final PointsStatusEnum orderStatus;
  final double points;
  final double orderNumber;
  final DateTime date;

  const PointsEntity({
    required this.orderStatus,
    required this.points,
    required this.orderNumber,
    required this.date,
  });

  @override
  List<Object?> get props => [orderStatus, points, orderNumber, date];
}

enum PointsStatusEnum { earned, replaced} 
