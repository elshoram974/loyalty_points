import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/extensions/string_ex.dart';

import '../../../../core/shared/my_network_image.dart';
import '../../../../core/shared/responsive/constrained_box.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/constants/app_color.dart';
import '../../../../core/utils/constants/app_constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Mohammed Shora";
    String? image =  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc9APxkj0xClmrU3PpMZglHQkx446nQPG6lA&s";
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
        child: MyResConstrainedBoxAlign(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: ClipOval(
                      child: MyNetworkImage(
                        image,
                        placeHolder: CircleAvatar(
                          radius: double.maxFinite,
                          backgroundColor: AppColor.greyBackground,
                          child: FittedBox(
                            child: Text(
                              name.nameAbbreviation,
                              style: context.textTheme.headlineLarge,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        style: context.textTheme.bodyMedium,
                        children: [
                          TextSpan(text: localeLang(context).welcomeToYou),
                          const TextSpan(text: ",\n"),
                          TextSpan(text: name),
                        ]),
                  ),
                ],
              ),
              Image.asset(AppAssets.fullLogo, height: 50),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}