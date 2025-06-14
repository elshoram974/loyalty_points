import 'package:flutter/material.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
    this.onUpdate,
    required this.isLoading,
  });
  final void Function()? onUpdate;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      onPressed: onUpdate,
      isLoading: isLoading,
      text: localeLang(context).update,
      minimumSize: const Size.fromHeight(50),
    );
  }
}
