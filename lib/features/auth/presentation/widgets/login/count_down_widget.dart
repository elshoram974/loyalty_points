import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:timer_count_down/timer_count_down.dart';


class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 200, top: 10),
      child: CupertinoPageScaffold(
        backgroundColor: Colors.transparent,
        child: Countdown(
          seconds: 7,
          build: (_, double time) {
            final isZero = time.toInt() == 0;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isZero ? '' : '${time.toInt()} seconds',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                if (isZero)
                  TextButton(
                    onPressed: () {
                      
                    },
                   child:Text(localeLang(context).resendCode,style: TextStyle(
                    color: context.theme.primaryColor,
                    fontSize: 10,
                    
                   ),),
                   
                  ),
              ],
            );
          },
          onFinished: () {},
        ),
      ),
    );
  }
}
