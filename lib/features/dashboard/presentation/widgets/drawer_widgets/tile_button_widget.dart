import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/app_constants.dart';

class TileButtonWidget extends StatelessWidget {
  const TileButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.icon,
    this.color = Colors.white,
    this.trailingIcon = Icons.arrow_forward_ios_outlined,
  });
  final String title;
  final IconData? icon;
  final IconData? trailingIcon;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: AppConst.paddingSmall),
      color: color,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onTap: onTap == null
            ? null
            : () {
                Get.back();
                onTap!();
              },
        titleTextStyle: context.textTheme.titleMedium,
        title: Text(title),
        leading: icon == null ? null : FaIcon(icon),
        trailing: trailingIcon == null
            ? null
            : Icon(
                trailingIcon,
                size: 16,
              ),
      ),
    );
  }
}
