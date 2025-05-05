import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
      trailing: icon == null ? null : FaIcon(icon, color: Colors.white),
    );
  }
}