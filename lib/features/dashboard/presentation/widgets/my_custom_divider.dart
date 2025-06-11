import 'package:flutter/material.dart';

import '../../../../core/utils/constants/app_constants.dart';

class MyCustomDivider extends StatelessWidget {
  const MyCustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      height: 1,
      endIndent: AppConst.paddingDefault,
      indent: AppConst.paddingDefault,
    );
  }
}
