import 'package:flutter/material.dart';
import 'package:loyalty_points/features/dashboard/presentation/widgets/home_widgets/points_balance_widget.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../widgets/my_app_bar.dart';

class AddNewCode extends StatelessWidget {
  const AddNewCode({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          PointsBalanceWidget(),
          Text('')
        ],
      ),
    );
  }
}
