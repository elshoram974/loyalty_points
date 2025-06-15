import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/custom_drop_down_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class ChooseAddressWidget extends StatelessWidget {
  const ChooseAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppConst.paddingDefault,
      children: [
        const SizedBox(height: AppConst.paddingExtraSmall),
        Text(
          localeLang(context).address,
          style: context.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        Row(
          spacing: AppConst.paddingDefault,
          children: [
            Expanded(
              child: CustomDropDownButton(
                autofillHints: const [AutofillHints.addressState],
                prefixIcon: Icons.map,
                hint: localeLang(context).governorate,
                items: [],
                onChanged: (val) {},
                errorMessage: localeLang(context).selectGovernorate,
              ),
            ),
            Expanded(
              child: CustomDropDownButton(
                autofillHints: const [AutofillHints.addressCity],
                prefixIcon: Icons.location_city,
                hint: localeLang(context).city,
                errorMessage: localeLang(context).selectCity,
                items: items,
                onChanged: (val) {
                  print(val);
                },
              ),
            ),
            if (!context.isPhone) Expanded(child: areaDropDown()),
          ],
        ),
        if (context.isPhone) areaDropDown(),
      ],
    );
  }

  Widget areaDropDown() {
    return Builder(
      builder: (context) {
        return CustomDropDownButton(
          autofillHints: const [AutofillHints.sublocality],
          hint: localeLang(context).area,
          errorMessage: localeLang(context).selectArea,
          items: items,
          prefixIcon: Icons.location_on,
        );
      },
    );
  }
}

List<String> get items => ["القاهرة", "الجيزة", "gharbia"];
