import 'package:flutter/material.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(AppConst.radiusSmall),
    ),
  });
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      onPressed: () => Navigator.maybePop(context),
      borderRadius: borderRadius,
      text: localeLang(context).update,
      minimumSize: const Size.fromHeight(50),
    );
  }
}
