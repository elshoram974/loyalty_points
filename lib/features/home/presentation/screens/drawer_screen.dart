import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/locale/local_lang.dart';
import '../controller/home_controller.dart';

class HomeDrawer extends GetView<HomeController> {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.primaryColor,
      child: Column(
        children: [
          Spacer(flex: 4),
          Spacer(flex: 5),
          TileButtonWidget(
            title: localeLang(context).changeLanguageTo("arabic"),
          ),
          TileButtonWidget(
            title: localeLang(context).logOut,
            onTap: controller.logOut,
          ),
        ],
      ),
    );
  }
}

class TileButtonWidget extends StatelessWidget {
  const TileButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
  });
  final String title;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap == null
      ? null 
      : (){
        Get.back();
        onTap!();
      },
      titleTextStyle: context.textTheme.titleMedium?.copyWith(color: Colors.white),
      title: Text(title),
      trailing: icon == null ? null : Icon(icon),
    );
  }
}
