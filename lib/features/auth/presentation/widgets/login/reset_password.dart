import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/shared/custom_scaffold.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../../core/shared/default_field.dart';

class ResetPasswordFields extends StatelessWidget {
  const ResetPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12 * AppConst.paddingDefault),
          TextToResetPass(
            text: localeLang(context).enterNewPassword,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConst.paddingBig,
                vertical: AppConst.paddingSmall),
            child: MyDefaultField(
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 2 * AppConst.paddingDefault),
          TextToResetPass(
            text: localeLang(context).confirmPassword,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppConst.paddingBig,
                vertical: AppConst.paddingSmall),
            child: MyDefaultField(
              fillColor: Colors.white,
              filled: true,
            ),
          ),
          const SizedBox(height: 3 * AppConst.paddingDefault),
          Center(
              child: FilledButton(
                  onPressed: () {},
                  child: Text('${localeLang(context).changePassword}')))
        ],
      ),
    );
  }
}

class TextToResetPass extends StatelessWidget {
  final String text;
  const TextToResetPass({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.paddingBig,
      ),
      child: Text(text,
          style: context.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
