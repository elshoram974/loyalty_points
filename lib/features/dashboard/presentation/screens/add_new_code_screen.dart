import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

import '../../../../core/shared/cancel_confirm_buttons_widget.dart';
import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/shared/points_balance_widget.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../auth/presentation/widgets/auth_field.dart';
import '../controller/add_new_code_controller.dart';
import '../widgets/add_new_code_widgets/barcode_camera_button.dart';

class AddNewCodeScreen extends GetView<AddNewCodeController> {
  const AddNewCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      canPop: false,
      onPopInvokedWithResult: (_, __) => controller.onPopInvoked(),
      body: ListView(
        children: [
          const PointsBalanceWidget(),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.paddingDefault,
            ),
            child: AuthField(
              label: localeLang(context).addNewCode,
              hintText: localeLang(context).addNewCode,
              labelStyle: context.textTheme.headlineSmall,
              controller: controller.textController,
              onChanged: (_) => controller.update(),
            ),
          ),
          const SizedBox(height: AppConst.paddingDefault),
          const BarCodeCameraButton(),
          const SizedBox(height: 50),
          GetBuilder<AddNewCodeController>(
            builder: (controller) => CancelAndConfirmButtons(
              isLoading: controller.isLoading,
              onPressConfirm: controller.textController.text.trim().isEmpty
                  ? null
                  : controller.scanCode,
            ),
          )
        ],
      ),
    );
  }
}
