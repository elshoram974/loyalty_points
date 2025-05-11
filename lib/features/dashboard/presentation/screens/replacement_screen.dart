import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../core/shared/points_balance_widget.dart';

import '../widgets/avaliable_points.dart/instructions_replacement_container.dart';
import '../widgets/avaliable_points.dart/list_points_pounds.dart';

class ReplacemrntScreen extends StatelessWidget {
  const ReplacemrntScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const PointsBalanceWidget(),
        const ContainerForReplacement(),
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppConst.paddingDefault),
          child: Text(
            localeLang(context).avaliablePoints,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const ListOfPointsAndPounds()
      ],
    );
  }
}
