import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class SocialMediaType extends Equatable {
  final String link;

  String get name;

  IconData get icon;

  String get url;

  static final List<SocialMediaType> allTypes = List.unmodifiable(
    [
      const TikTokSocial(),
      const WhatsappSocial(),
      const TelegramSocial(),
      const InstagramSocial(),
      const FacebookSocial(),
    ],
  );

  static List<SocialMediaType> fromMap(List<String> types) {
    final List<SocialMediaType> result = [];
    for (SocialMediaType t in allTypes) {
      if (types.contains(t.name)) result.add(t);
    }
    return result;
  }

  const SocialMediaType({this.link = ''});

  @override
  List<Object?> get props => [link, name, icon, url];
}

class TikTokSocial extends SocialMediaType {
  const TikTokSocial({super.link});
  @override
  String get name => 'tiktok';

  @override
  IconData get icon => FontAwesomeIcons.tiktok;

  @override
  String get url => 'https://www.tiktok.com/@$link';
}

class FacebookSocial extends SocialMediaType {
  const FacebookSocial({super.link});
  @override
  String get name => 'facebook';

  @override
  IconData get icon => FontAwesomeIcons.facebook;

  @override
  String get url => 'https://www.facebook.com/$link';
}

class InstagramSocial extends SocialMediaType {
  const InstagramSocial({super.link});
  @override
  String get name => 'instagram';

  @override
  IconData get icon => FontAwesomeIcons.instagram;

  @override
  String get url => 'https://www.instagram.com/$link';
}

class TelegramSocial extends SocialMediaType {
  const TelegramSocial({super.link});
  @override
  String get name => 'telegram';

  @override
  IconData get icon => FontAwesomeIcons.telegram;
  @override
  String get url => 'https://t.me/$link';
}

class WhatsappSocial extends SocialMediaType {
  const WhatsappSocial({super.link});
  @override
  String get name => 'whatsapp';

  @override
  IconData get icon => FontAwesomeIcons.whatsapp;
  @override
  String get url => 'https://wa.me/$link';
}
