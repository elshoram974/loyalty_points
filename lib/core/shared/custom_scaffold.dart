import 'package:flutter/material.dart';

import '../utils/constants/app_color.dart';
import 'responsive/constrained_box.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.canPop = true,
    this.body,
    this.onPopInvokedWithResult,
    this.drawer,
    this.bottomNavigationBar,
    this.appBar,
  });
  final bool canPop;
  final Widget? body;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final void Function(bool, Object?)? onPopInvokedWithResult;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColor.backgroundGradient,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 1],
        ),
      ),
      child: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.transparent,
          drawer: drawer,
          bottomNavigationBar: bottomNavigationBar,
          body: SafeArea(
            child: MyResConstrainedBoxAlign(child: body ?? const SizedBox()),
          ),
        ),
      ),
    );
  }
}
