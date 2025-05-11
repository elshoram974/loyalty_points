import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/filled_button.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../controller/add_new_code_controller.dart';

class CancelAndConfirmButtons extends StatelessWidget {
  const CancelAndConfirmButtons({super.key});

  @override
  Widget build(BuildContext context) {
    const Size size = Size.fromHeight(40);
    final BorderRadius radius = BorderRadius.circular(AppConst.radiusSmall);
    final TextStyle? style = context.textTheme.headlineSmall;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConst.paddingExtraBig,
        horizontal: AppConst.paddingDefault,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomFilledButton(
              onPressed: () => Navigator.maybePop(context),
              filledColor: Colors.grey,
              borderRadius: radius,
              text: localeLang(context).cancel,
              style: style,
              minimumSize: size,
            ),
          ),
          const SizedBox(width: AppConst.paddingDefault),
          Expanded(
            child: GetBuilder<AddNewCodeController>(
              init: AddNewCodeControllerImp(), 
              builder: (controller) {
                return CustomFilledButton(
                  isLoading: controller.isLoading,
                  onPressed: controller.textController.text.trim().isEmpty
                      ? null
                      : controller.addNewCode,
                  filledColor: context.theme.primaryColor,
                  borderRadius: radius,
                  text: localeLang(context).confirm,
                  style: style,
                  minimumSize: size,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
