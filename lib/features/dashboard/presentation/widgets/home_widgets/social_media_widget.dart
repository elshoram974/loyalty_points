import 'package:flutter/material.dart';
import 'package:loyalty_points/core/utils/functions/handle_url.dart';

import '../../../../../core/utils/constants/app_constants.dart';
import '../../../../../core/utils/types/social_media_type.dart';

class SocialMediaWidget extends StatelessWidget {
  final List<SocialMediaType> items;

  const SocialMediaWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppConst.paddingDefault,
        horizontal: AppConst.paddingDefault,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          items.length,
          (index) => GestureDetector(
            onTap: () => launchURL(items[index].url),
            child: Icon(items[index].icon, size: 35),
          ),
        ),
      ),
    );
  }
}
