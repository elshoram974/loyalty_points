import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../../../core/shared/filled_button.dart';
import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/config/routes/routes.dart';
import '../../../../../core/utils/constants/app_assets.dart';
import '../../../../../core/utils/constants/app_constants.dart';
import '../../controller/login_controller.dart';
import 'forget_password.dart';

class LoginButtons extends StatelessWidget {
  const LoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: controller.isLoading ? null : () {
                  Get.to(() => const ResetPassword());
                },
                child: Text(
                  localeLang(context).forgetPassword,
                  style: context.textTheme.titleSmall
                      ?.copyWith(color: context.theme.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: AppConst.paddingSmall),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  if (controller.showBiometricsButton) ...[
                    CustomFilledButton(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size.square(60),
                      onPressed: controller.canUseBiometrics
                          ? controller.biometricsLogin
                          : null,
                      icon: controller.hasFaceId
                          ? const Image(
                              image: AssetImage(AppAssets.faceId),
                              width: 30,
                              height: 30,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.fingerprint,
                              color: Colors.white,
                              size: 40,
                            ),
                    ),
                    const SizedBox(width: AppConst.paddingDefault),
                  ],
                  Expanded(
                    child: CustomFilledButton(
                      minimumSize: Size.infinite,
                      text: localeLang(context).login,
                      isLoading: controller.isLoading,
                      onPressed: controller.login,
                      style: context.textTheme.headlineMedium,
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !controller.canUseBiometrics && controller.showBiometricsButton,
              maintainState: true,
              child: TimerWidget(
                controller: controller.timerController,
                duration: const Duration(seconds: 30),
                callback: () {
                  controller.changeUsingBiometrics(true);
                  controller.checkAuthenticate();
                },
              ),
            ),
            const SizedBox(height: 70),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textTheme.titleMedium,
                children: [
                  TextSpan(text: localeLang(context).doNotHaveAnAccount),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: localeLang(context).signUp,
                    style: context.textTheme.titleMedium?.copyWith(
                      color: context.theme.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: context.theme.primaryColor,
                      decorationThickness: 2,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.toNamed(AppRoute.signUp),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required this.duration,
    required this.callback,
    this.controller,
  });
  final CountdownController? controller;

  final Duration duration;
  final void Function() callback;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.only(top: AppConst.paddingDefault),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.paddingSmall,
          vertical: AppConst.paddingExtraSmall,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Countdown(
          controller: controller,
          seconds: duration.inSeconds,
          onFinished: callback,
          build: (BuildContext context, double seconds) => Text(
            localeLang(context).biometricWaitMessage(seconds.toInt()),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
