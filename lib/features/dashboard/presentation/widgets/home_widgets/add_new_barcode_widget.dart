import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/features/dashboard/presentation/screens/add_new_code_screen.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class AddNewBarcodeWidget extends StatelessWidget {
  const AddNewBarcodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => Get.toNamed(AppRoute.newBarcode),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(
                    color: Colors.white, width: AppConst.borderDefualtWidth),
                padding: const EdgeInsets.all(AppConst.paddingBig),
                backgroundColor: context.theme.primaryColor),
            child: const FaIcon(
              FontAwesomeIcons.plus,
              color: Colors.white,
              size: 20,
            ),
          ),
          Text(
            localeLang(context).addNewCode,
            style: context.textTheme.titleLarge?.copyWith(
                color: context.theme.primaryColor, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
