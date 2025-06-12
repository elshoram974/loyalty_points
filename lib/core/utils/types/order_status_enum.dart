import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../config/locale/local_lang.dart';
import '../constants/app_color.dart';

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
        return AppColor.pendingTextColor;
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
    factory OrderStatusEnum.fromString(String? inString) {
    switch (inString) {
      case 'complete':
        return accepted;
      case 'pending':
        return pending;
      case 'cancelled':
        return rejected;
    }
    return rejected;
  }
}