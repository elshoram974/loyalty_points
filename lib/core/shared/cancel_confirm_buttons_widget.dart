import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config/locale/local_lang.dart';
import '../utils/constants/app_constants.dart';
import 'filled_button.dart';

class CancelAndConfirmButtons extends StatelessWidget {
  const CancelAndConfirmButtons({
    super.key,
    this.isLoading = false,
    this.onPressConfirm,
  });

  final bool isLoading;
  final void Function()? onPressConfirm;

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
            child: CustomFilledButton(
              isLoading: isLoading,
              onPressed: onPressConfirm,
              filledColor: context.theme.primaryColor,
              borderRadius: radius,
              text: localeLang(context).confirm,
              style: style,
              minimumSize: size,
            ),
          ),
        ],
      ),
    );
  }
}
