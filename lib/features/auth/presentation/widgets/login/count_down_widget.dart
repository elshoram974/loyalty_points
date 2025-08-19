import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../../core/utils/config/locale/local_lang.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../dashboard/presentation/controller/send_otp_controller.dart';
import '../../../domain/repositories/auth_repositories.dart';
import 'package_time_count_down.dart';
class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key, required this.mobile});
  final String mobile;

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  bool _isTimeUp = false;
  bool _sending = false;

  DateTime _endTime = DateTime.now().add(const Duration(seconds: 90));

  Future<void> _resend() async {
    if (_sending) return;

    if (!Get.isRegistered<SendOtpController>()) {
    if (Get.isRegistered<AuthRepositories>()) {
      Get.put<SendOtpController>(SendOtpControllerImp(Get.find<AuthRepositories>()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(localeLang(context).somethingWentWrong)),
      );
      return;
    }
  }

    setState(() => _sending = true);
    try {
      await Get.find<SendOtpController>().sendCode(widget.mobile);
      setState(() {
        _isTimeUp = false;
        _endTime = DateTime.now().add(const Duration(seconds: 90));
      });
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppConst.paddingBig),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_isTimeUp)
            TimerCountdown(
              spacerWidth: 2,
              enableDescriptions: false,
              format: CountDownTimerFormat.minutesSeconds,
              endTime: _endTime,
              onEnd: () {
                if (mounted) setState(() => _isTimeUp = true);
              },
              timeTextStyle: AppStyle.styleBoldRegular16,
              colonsTextStyle: AppStyle.styleBoldRegular16,
            ),
          const SizedBox(width: 2),
          if (_isTimeUp)
            TextButton(
              onPressed: _sending ? null : _resend,
              child: _sending
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(
                      localeLang(context).resendCodeNow,
                      style: AppStyle.styleBoldRegular13,
                    ),
            )
          else
            Text(
              localeLang(context).resendCodeIn,
              style: AppStyle.styleBoldRegular16,
            ),
        ],
      ),
    );
  }
}
