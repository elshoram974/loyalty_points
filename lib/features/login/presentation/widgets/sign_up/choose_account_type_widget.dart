import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/types/account_type.dart';
import '../../controller/sign_up_controller.dart';

class ChooseAccountTypeWidget extends StatelessWidget {
  const ChooseAccountTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppConst.paddingDefault),
        Text(
          localeLang(context).type,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        GetBuilder<SignUpController>(
          builder: (controller) {
            return Row(
              spacing: AppConst.paddingSmall,
              children: [
                _AccountTypeRadioWidget(
                  value: const StoreAccount(),
                  groupValue: controller.accountType,
                  title: localeLang(context).distributorOrStore,
                  onChanged: controller.changeAccountType,
                ),
                _AccountTypeRadioWidget(
                  value: const DeliveryManAccount(),
                  groupValue: controller.accountType,
                  title: localeLang(context).deliveryMan,
                  onChanged: controller.changeAccountType,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _AccountTypeRadioWidget extends StatelessWidget {
  const _AccountTypeRadioWidget({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });
  final String title;
  final AccountType value;
  final AccountType? groupValue;
  final void Function(AccountType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile<AccountType>(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppConst.radiusDefault)),
        dense: true,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: const VisualDensity(horizontal: VisualDensity.minimumDensity),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        title: Text(title, style: context.textTheme.labelMedium),
      ),
    );
  }
}
