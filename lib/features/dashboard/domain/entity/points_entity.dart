import 'package:equatable/equatable.dart';

import '../../../../core/utils/types/points_status_enum.dart';

class PointsEntity extends Equatable {
  final PointsStatusEnum orderStatus;
  final int points;
  final int? orderNumber;
  final DateTime date;
  final String? description;
  final DateTime? updatedAt;

  const PointsEntity({
    required this.orderStatus,
    required this.points,
    required this.date,
    this.orderNumber,
    this.description,
    this.updatedAt,
  });

  factory PointsEntity.empty() {
    return PointsEntity(
      orderStatus: PointsStatusEnum.add,
      points: 0,
      date: DateTime.now(),
    );
  }

  @override
  List<Object?> get props => [
        description,
        updatedAt,
        orderStatus,
        points,
        orderNumber,
        date,
      ];
}
