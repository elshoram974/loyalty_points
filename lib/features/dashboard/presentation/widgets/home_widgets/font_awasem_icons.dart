import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwasemIcons extends StatelessWidget {
  const FontAwasemIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 15),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(FontAwesomeIcons.tiktok),
          Icon(FontAwesomeIcons.whatsapp),
          Icon(FontAwesomeIcons.telegram),
          Icon(FontAwesomeIcons.instagram),
          Icon(FontAwesomeIcons.facebook),
        ],
      ),
    );
  }
}
