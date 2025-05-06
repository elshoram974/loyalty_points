import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';

class AbusingCode extends StatelessWidget {
  const AbusingCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(localeLang(context).howToAbusingCode,style: context.textTheme.headlineSmall,),
        ),
      ],
    );
  }
}