import 'package:flutter/material.dart';

import '../config/locale/local_lang.dart';
import '../constants/app_color.dart';

enum PointsStatusEnum {
  discount,
  add;

  Color get color {
    switch (this) {
      case PointsStatusEnum.add:
        return Colors.green;
      case PointsStatusEnum.discount:
        return AppColor.pendingTextColor;
    }
  }

  String get name {
    switch (this) {
      case PointsStatusEnum.discount:
        return localeLang().discount;
      case PointsStatusEnum.add:
        return localeLang().addition;
    }
  }

  factory PointsStatusEnum.fromString(String? inString) {
    switch (inString) {
      case 'add':
        return add;
      case 'subtract':
        return discount;
    }
    return add;
  }
}
