import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_constants.dart';

abstract final class MyTextFieldDecoration {
  const MyTextFieldDecoration();

  static OutlineInputBorder get border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConst.radiusSmall),
    );
  }

  static OutlineInputBorder get enabledBorder {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(AppConst.radiusSmall),
    );
  }

  static InputDecoration defaultDecoration(
    BuildContext context, {
    String? hintText,
    IconData? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColor.borderColor),
      contentPadding: const EdgeInsets.symmetric(horizontal: 22),
      disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      border: border,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon == null
          ? null
          : Icon(
              prefixIcon,
              color: Theme.of(context).primaryColor.withValues(alpha: 0.8),
            ),
      enabledBorder: enabledBorder,
      filled: true,
      fillColor: Colors.white
      // Theme.of(context).scaffoldBackgroundColor,
    );
  }
}
