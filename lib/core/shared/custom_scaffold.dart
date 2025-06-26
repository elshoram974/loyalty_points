import 'package:flutter/material.dart';

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
    this.scaffoldKey,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });
  final bool canPop;
  final Widget? body;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final void Function(bool, Object?)? onPopInvokedWithResult;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: canPop,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        endDrawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        body: SafeArea(
          child: MyResConstrainedBoxAlign(child: body ?? const SizedBox()),
        ),
      ),
    );
  }
}
