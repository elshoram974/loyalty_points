import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../config/locale/local_lang.dart';
import '../constants/app_color.dart';

enum PointsStatusEnum {
  redeem,
  add;

  Color get color {
    switch (this) {
      case add:
        return Colors.green;
      case redeem:
        return AppColor.pendingTextColor;
    }
  }

  String get name {
    switch (this) {
      case redeem:
        return localeLang().redeem;
      case add:
        return localeLang().addition;
    }
  }

  factory PointsStatusEnum.fromString(String? inString) {
    switch (inString) {
      case 'add':
        return add;
      case 'subtract':
        return redeem;
    }
    return add;
  }
    IconData get icon {
    switch (this) {
      case add:
        return Icons.check_outlined;
      case redeem:
        return FontAwesomeIcons.recycle;
 
    }
  }

  // factory PointsStatusEnum.fromString(String? inString) {
  //   switch (inString) {
  //     case 'complete':
  //       return add;
  //     case 'pending':
  //       return redeem;
  //     case 'cancelled':
  //       return rejected;
  //   }
  //   return rejected;
  //}
}
