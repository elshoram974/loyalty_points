import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReplacePointsFloatingButtonWidget extends StatelessWidget {
  const ReplacePointsFloatingButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      shape: CircleBorder(
        side: BorderSide(
          color: context.theme.bottomNavigationBarTheme.backgroundColor!,
          width: 5
        ),
      ),
    );
  }
}
