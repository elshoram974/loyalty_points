import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_info.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../widgets/policies_widgets/policies_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          ParagraphPolicy(
            title: localeLang(context).privacyPolicy,
            paragraph: localeLang(context).privacyIntro(AppInfo.appName),
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyInfoCollectionTitle,
            paragraph: localeLang(context).privacyInfoCollection,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyThirdPartyTitle,
            paragraph: localeLang(context).privacyThirdParty,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).privacyGooglePlay,
            onTap: () async {
              await launchUrl(Uri.parse("https://policies.google.com/privacy"));
            },
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).privacyDisclosure,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyOptOutTitle,
            paragraph: localeLang(context).privacyOptOut,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyRetentionTitle,
            paragraph: localeLang(context).privacyRetention,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyChildrenTitle,
            paragraph: localeLang(context).privacyChildren,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacySecurityTitle,
            paragraph: localeLang(context).privacySecurity,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyChangesTitle,
            paragraph: localeLang(context).privacyChanges,
          ),
          ParagraphPolicy(
            title: localeLang(context).yourAgreement,
            paragraph: localeLang(context).consent,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyContactUsTitle,
            paragraph: localeLang(context).privacyContactUs,
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(localeLang(context).privacyPolicy),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      elevation: 0,
    );
  }
}
