import 'package:flutter/material.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      onPressed: () => Navigator.maybePop(context),
      borderRadius: BorderRadius.circular(AppConst.radiusSmall),
      text: localeLang(context).update,
      minimumSize: const Size.fromHeight(40),
    );
  }
}