import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../app_info.dart';
import '../../../../core/utils/constants/app_constants.dart';
import '../widgets/policies_widgets/policies_widget.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ListView(
        padding: const EdgeInsets.all(AppConst.paddingDefault),
        children: [
          ParagraphPolicy(
            title: localeLang(context).termsTitle,
            paragraph: localeLang(context).termsIntro(AppInfo.appName),
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsPersonalData,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsThirdPartyServices,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsGooglePlay,
            onTap: () async {
              await launchUrl(Uri.parse("https://policies.google.com/terms"));
            },
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsConnectivityDisclaimer,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsDataCharges,
          ),


 
          ParagraphPolicy(
            title: localeLang(context).termsChangesTitle,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).changeOnTerms,
          ),
        
          ParagraphPolicy(
            paragraph: localeLang(context).dateOfTerms,
          ),
          ParagraphPolicy(
            title: localeLang(context).privacyContactUsTitle,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsContact,
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(localeLang(context).termsTitle),
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
