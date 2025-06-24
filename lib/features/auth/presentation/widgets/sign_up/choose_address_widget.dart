import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/custom_drop_down_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/constants/app_strings.dart';
import '../../controller/sign_up_controller.dart';

class ChooseAddressWidget extends StatelessWidget {
  const ChooseAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      id: AppString.updateAddress,
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: AppConst.paddingSmall,
          children: [
            const SizedBox(height: AppConst.paddingSmall),
            RichText(
              text: TextSpan(
                text: localeLang(context).address,
                style: context.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Get.theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ),
            if (context.isPhone) countryDropDown(controller),
            Row(
              spacing: AppConst.paddingDefault,
              children: [
                if (!context.isPhone)
                  Expanded(child: countryDropDown(controller)),
                Expanded(
                  child: CustomDropDownButton(
                    enabled: controller.country != null && controller.governorates.isNotEmpty,
                    autofillHints: const [AutofillHints.addressState],
                    prefixIcon: Icons.location_city,
                    hint: localeLang(context).governorate,
                    items: [],
                    onChanged: (val) {},
                    errorMessage: localeLang(context).selectGovernorate,
                  ),
                ),
                Expanded(
                  child: CustomDropDownButton(
                    enabled: controller.governorate != null && controller.cities.isNotEmpty,
                    autofillHints: const [AutofillHints.addressCity],
                    prefixIcon: Icons.location_on,
                    hint: localeLang(context).city,
                    errorMessage: localeLang(context).selectCity,
                    items: items,
                    onChanged: (val) {
                      print(val);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget countryDropDown(SignUpController controller) {
    return Builder(
      builder: (context) {
        return CustomDropDownButton(
          enabled: controller.cities.isNotEmpty,
          autofillHints: const [AutofillHints.countryName],
          hint: localeLang(context).country,
          errorMessage: localeLang(context).selectCountry,
          items: items,
          prefixIcon: Icons.map,
        );
      },
    );
  }
}

List<String> get items => ["القاهرة", "الجيزة", "gharbia"];
