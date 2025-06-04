import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loyalty_points/core/utils/config/locale/local_lang.dart';
import 'package:url_launcher/url_launcher.dart';



class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: _appBar(context),
      body: ListView(
        children: [
          ParagraphPolicy(
            title: localeLang(context).termsTitle,
            paragraph: localeLang()
                    .termsIntro(localeLang().business_name),
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsAgreement,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsRightsAndCharges,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsPrivacy,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsThirdParty,
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsGooglePlay,
            onTap: () async {
              await launchUrl(Uri.parse("https://policies.google.com/terms"));
            },
          ),
          ParagraphPolicy(
            paragraph: localeLang(context).termsDisclaimer,
          ),
          ParagraphPolicy(
            title: localeLang(context).termsChangesTitle,
            paragraph: localeLang(context).termsChanges + "\n\n" + localeLang(context).termsEffectiveDate,
          ),
          ParagraphPolicy(
            title: localeLang(context).termsContactUsTitle,
            paragraph: localeLang(context).termsContactUs,
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(localeLang(context).termsConditions),
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
class ParagraphPolicy extends StatelessWidget {
  final String? title;
  final String paragraph;
  final VoidCallback? onTap;

  const ParagraphPolicy({
    Key? key,
    this.title,
    required this.paragraph,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
          ],
          Text(paragraph),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
