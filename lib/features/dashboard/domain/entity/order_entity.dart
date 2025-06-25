import 'package:equatable/equatable.dart';

import '../../../../core/utils/types/order_status_enum.dart';
import '../../../../core/utils/types/payment_methods.dart';

class OrderEntity extends Equatable {
  final OrderStatusEnum orderStatus;
  final int points;
  final double price;
  final DateTime date;
  final String phone;
  final PaymentMethod paymentMethod;
  final String? imageUrl;
  final String? adminNote;

  const OrderEntity({
    required this.orderStatus,
    required this.points,
    required this.price,
    required this.date,
    required this.phone,
    required this.paymentMethod,
    required this.imageUrl,
    this.adminNote,
  });

  @override
  List<Object?> get props => [
        orderStatus,
        points,
        price,
        date,
        phone,
        paymentMethod,
        imageUrl,
        adminNote,
      ];
}
