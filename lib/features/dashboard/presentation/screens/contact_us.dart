import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/shared/custom_scaffold.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../../../../core/utils/functions/handle_url.dart';
import '../../../../core/utils/types/social_media_type.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen(this.items, {super.key});
  final List<SocialMediaType> items;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          localeLang(context).contactUs,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          vertical: AppConst.paddingBig,
          horizontal: AppConst.paddingDefault,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => launchURL(items[index].url),
            child: ListTile(
              leading: Icon(
                items[index].icon,
                size: 35,
              ),
              title: Text(items[index].name),
              subtitle: Text(items[index].description),
            ),
          );
        },
      ),
    );
  }
}
