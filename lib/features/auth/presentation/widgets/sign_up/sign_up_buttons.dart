import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../controller/sign_up_controller.dart';
import 'attachments_validation_widget.dart';
import 'choose_account_type_widget.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.find<SignUpController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ChooseAccountTypeWidget(),
        AttachmentsValidationWidget(
          title: localeLang(context).attachProfilePhoto,
          errorMessage: localeLang(context).uHaveToAddProfileImage,
          files: [controller.profile],
          onChanged: (images) => controller.profile = images.firstOrNull,
        ),
        const SizedBox(height: AppConst.paddingDefault),
        AttachmentsValidationWidget(
          title: localeLang(context).attachStorefrontPhotos,
          errorMessage: localeLang(context).addAtLeastOneImage,
          files: controller.attachments,
          onChanged: (images) => controller.attachments = images,
        ),
        const SizedBox(height: 70),
        GetBuilder<SignUpController>(builder: (controller) {
          return CustomFilledButton(
            text: localeLang(context).signUp,
            isLoading: controller.isLoading,
            onPressed: controller.signUp,
            style: context.textTheme.headlineMedium,
          );
        }),
        const SizedBox(height: AppConst.paddingExtraBig),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: context.textTheme.titleMedium, children: [
            TextSpan(text: localeLang(context).haveAnAccount),
            const TextSpan(text: ' '),
            TextSpan(
              text: localeLang(context).login,
              style: context.textTheme.titleMedium?.copyWith(
                color: context.theme.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: context.theme.primaryColor,
                decorationThickness: 2,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => Navigator.maybePop(context),
            ),
          ]),
        ),
      ],
    );
  }
}

class TextErrorIfErrorWidget extends StatelessWidget {
  const TextErrorIfErrorWidget(this.state, {super.key});
  final FormFieldState state;

  @override
  Widget build(BuildContext context) {
    if (!state.hasError || state.errorText == null) return const SizedBox();
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: AppConst.paddingBig, top: AppConst.paddingExtraSmall),
      child: Text(
        state.errorText!,
        style: context.textTheme.bodySmall
            ?.copyWith(color: context.theme.colorScheme.error),
      ),
    );
  }
}
