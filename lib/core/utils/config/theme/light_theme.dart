import 'package:flutter/material.dart';

import '../../constants/app_color.dart';

ThemeData get lightTheme => ThemeData(
      primaryColor: AppColor.primaryLight,
      brightness: Brightness.light,
      cardColor: Colors.grey.shade300,
      textTheme:const TextTheme(
        labelLarge: TextStyle(fontSize: 17),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        enableFeedback: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      ),
      colorScheme: const ColorScheme.light(
        primary: AppColor.primaryLight,
        secondary: AppColor.secondaryLight,
      ),
    );
