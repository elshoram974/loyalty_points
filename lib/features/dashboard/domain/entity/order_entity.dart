import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final OrderStatusEnum orderStatus;
  final double points;
  final double price;
  final DateTime date;

  const OrderEntity({
    required this.orderStatus,
    required this.points,
    required this.price,
    required this.date,
  });

  @override
  List<Object?> get props => [orderStatus, points, price, date];
}

enum OrderStatusEnum { pending, accepted, rejected }
