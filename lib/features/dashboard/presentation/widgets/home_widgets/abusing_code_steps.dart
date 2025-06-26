import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../data/model/burn_steps_model.dart';

class AbusingCodeSteps extends StatelessWidget {
  const AbusingCodeSteps({
    super.key,
    required this.burnStepsModel,
    required this.index,
  });

  final int index;
  final BurnStepsModel burnStepsModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(AppConst.paddingSmall),
        child: Image.asset(
          burnStepsModel.imagePath,)
      ),
      title: Text(
        burnStepsModel.title,
        style: context.textTheme.titleLarge?.copyWith(
          color: context.theme.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        burnStepsModel.subTitle,
        style: context.textTheme.titleSmall,
      ),
    );
  }
}
