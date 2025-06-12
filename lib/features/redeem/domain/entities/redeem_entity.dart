import 'dart:convert';

import '../../../../core/utils/types/payment_methods.dart';

class RedeemEntity {
  final int points;
  final PaymentMethod payment;
  final String phoneNumber;

  const RedeemEntity({
    required this.points,
    required this.payment,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'payment_method': payment.toJson,
      'payment_info': phoneNumber,
    };
  }

  String toJson() => jsonEncode(toMap());
}
