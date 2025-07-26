import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:loyalty_points/core/utils/constants/app_constants.dart';

import '../../../../../core/utils/styles.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  bool isTimeUp = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppConst.paddingBig),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isTimeUp)
            TextButton(
              onPressed: () {
                setState(() {
                  isTimeUp = false;
                });
              },
              child: Text(localeLang(context).resendCodeNow,
                  style: AppStyle.styleBoldRegular13),
            )
          else
            Text(
              localeLang(context).resendCodeIn,
              style: AppStyle.styleBoldRegular16,
            ),
          const SizedBox(
            width: 2,
          ),
          if (!isTimeUp)
            TimerCountdown(
              spacerWidth: 2,
              format: CountDownTimerFormat.minutesSeconds,
              endTime: DateTime.now().add(const Duration(seconds: 5)),
              onEnd: () {
                if (mounted) {
                  setState(() {
                    isTimeUp = true;
                  });
                }
              },
              timeTextStyle: AppStyle.styleBoldRegular16,
              colonsTextStyle: AppStyle.styleBoldRegular16,
              descriptionTextStyle: const TextStyle(fontSize: 0),
            ),
        ],
      ),
    );
  }
}
