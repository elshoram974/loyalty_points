import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (_, __) => Get.find<HomeController>().onPopInvoked(),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingBig),
        children: [
         
        ],
      ),
    );
  }
}
