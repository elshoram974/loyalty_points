import 'dart:convert';

import '../../../../core/utils/types/payment_methods.dart';

class RedeemEntity {
  final String points;
  final PaymentMethod payment;
  final String paymentRef;

  const RedeemEntity({
    required this.points,
    required this.payment,
    required this.paymentRef,
  });

  Map<String, dynamic> toMap() {
    return {
      'points': points,
      'payment_method': payment.toJson,
      'payment_ref': paymentRef,
    };
  }

  String toJson() => jsonEncode(toMap());
}
