import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../../../../core/utils/helper/my_text_decoration.dart';
import '../../../data/models/provider_model/provider_model.dart';
import '../../controller/sign_up_controller.dart';

class ChooseProviderWidget extends StatelessWidget {
  const ChooseProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppConst.paddingDefault),
        Text(
          localeLang(context).provider,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppConst.paddingSmall),
        GetBuilder<SignUpController>(
          id: AppString.providerId,
          builder: (controller) {
            return DropdownButtonFormField<ProviderModel>(
              isExpanded: true,
              hint: Text(localeLang(context).selectProvider),
              borderRadius: BorderRadius.circular(AppConst.radiusSmall),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: MyTextFieldDecoration.defaultDecoration(context, Icons.storefront),
              validator: (value) {
                if (controller.selectedProvider == null) {
                  return localeLang(context).uHaveToSelectAProvider;
                }
                return null;
              },
              items: List.generate(
                controller.providers.length,
                (i) {
                  return DropdownMenuItem(
                    value: controller.providers[i],
                    child: Text(controller.providers[i].name ?? ''),
                  );
                },
              ),
              onChanged: (value) => controller.selectedProvider = value,
            );
          },
        ),
      ],
    );
  }
}
