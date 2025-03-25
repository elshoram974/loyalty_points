import 'package:flutter/material.dart';

import '../utils/constants/app_color.dart';
import 'responsive/constrained_box.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key, 
    this.canPop = true, 
    this.body, 
    this.onPopInvokedWithResult, 
    this.gradientColors, 
    this.stops,
  });
  final bool canPop;
  final Widget? body;
  final List<Color>? gradientColors;
  final List<double>? stops;
  final void Function(bool, Object?)? onPopInvokedWithResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors ?? AppColor.backgroundGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: stops ?? [0.1,1]
        ),
      ),
      child: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(child: MyResConstrainedBoxAlign(child: body ?? const SizedBox())),
        ),
      ),
    );
  }
}