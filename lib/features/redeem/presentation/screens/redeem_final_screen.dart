import 'package:flutter/material.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../dashboard/presentation/widgets/my_app_bar.dart';
import '../widgets/avaliable_points/instructions_replacement_container.dart';

class RedeemFinalScreen extends StatelessWidget {
  const RedeemFinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const MyAppBar(),
      body: ListView(
        children: [
        const PointsBalanceWidget(),
        ContainerForReplacement(text: localeLang(context).cashbackOnPoints('100', '100'),)
      ,

          
      
      ],
        
      )
      
    );
  }
}