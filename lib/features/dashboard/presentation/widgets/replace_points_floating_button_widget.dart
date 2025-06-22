import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_constants.dart';

class ReplacePointsFloatingButtonWidget extends StatelessWidget {
  const ReplacePointsFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor =
        context.theme.bottomNavigationBarTheme.backgroundColor!;
    return FloatingActionButton.small(
      onPressed: () => Get.toNamed(AppRoute.redeemScreen),
      backgroundColor: context.theme.primaryColor,
      foregroundColor: foregroundColor,
      shape: CircleBorder(
        side: BorderSide(
          color: foregroundColor,
          width: AppConst.borderSmallWidth,
        ),
      ),
      child: const FaIcon(FontAwesomeIcons.arrowsRotate),
    );
  }
}
