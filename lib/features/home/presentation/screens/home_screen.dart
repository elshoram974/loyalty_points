import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/home_controller.dart';
import 'drawer_screen.dart';
import '../widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>(); 
    return CustomScaffold(
      canPop: false,
      scaffoldKey: key,
      onPopInvokedWithResult: (_, __) => Get.find<HomeController>().onPopInvoked(),
      appBar: const MyAppBar(),
      drawer: const HomeDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 1:
            
              key.currentState?.openEndDrawer();
              break;
            default:
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.document_scanner), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: '',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingBig),
        children: [],
      ),
    );
  }
}
