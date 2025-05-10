import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_assets.dart';

class SignUpCompletedImageTextWidget extends StatelessWidget {
  const SignUpCompletedImageTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Image.asset(AppAssets.trueIcon, width: 250)),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: localeLang(context).loginCompleted,
                style: context.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ' ',
                style: context.textTheme.headlineSmall,
              ),
              TextSpan(
                text: localeLang(context).successfully,
                style: context.textTheme.headlineSmall?.copyWith(
                    color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
