import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/types/payment_methods.dart';

class OrderEntity extends Equatable {
  final OrderStatusEnum orderStatus;
  final int points;
  final double price;
  final DateTime date;
  final String? phone;
  final PaymentMethod? paymentMethod;
  final String? imageUrl;

  const OrderEntity({
    required this.orderStatus,
    required this.points,
    required this.price,
    required this.date,
    required this.phone,
    required this.paymentMethod,
    required this.imageUrl,
  });

  @override
  List<Object?> get props =>
      [orderStatus, points, price, date, phone, paymentMethod, imageUrl];
}

enum OrderStatusEnum {
  pending,
  accepted,
  rejected;

  String get name {
    switch (this) {
      case pending:
        return localeLang().pending;
      case accepted:
        return localeLang().accepted;
      case rejected:
        return localeLang().rejected;
    }
  }

  Color get color {
    switch (this) {
      case accepted:
        return Colors.green;
      case pending:
        return Color(0xFFF57C00);
      case rejected:
        return Get.theme.colorScheme.error;
    }
  }

  IconData get icon {
    switch (this) {
      case accepted:
        return Icons.check_outlined;
      case pending:
        return FontAwesomeIcons.clock;
      case rejected:
        return Icons.close;
    }
  }
}
