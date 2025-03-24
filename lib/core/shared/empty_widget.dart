import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/config/locale/local_lang.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        localeLang(context).empty,
        style: context.textTheme.displayMedium?.copyWith(color: Colors.grey),
      ),
    );
  }
}
