import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../config/locale/local_lang.dart';

abstract class SocialMediaType extends Equatable {
  final String url;

  String get type;

  String get name;

  IconData get icon;

  String get description => localeLang().contactUsWith(name);

  static List<SocialMediaType> allTypes(String url) => List.unmodifiable(
        [
          TikTokSocial(url),
          WhatsappSocial(url),
          TelegramSocial(url),
          InstagramSocial(url),
          FacebookSocial(url),
        ],
      );

  static SocialMediaType? fromType(String type, String url) {
    final List<SocialMediaType> types = allTypes(url);
    for (SocialMediaType t in types) {
      if (t.type == type) return t;
    }
    return null;
  }

  const SocialMediaType(this.url);

  @override
  List<Object?> get props => [url, type, icon];
}

class TikTokSocial extends SocialMediaType {
  const TikTokSocial(super.url);
  @override
  String get type => 'tiktok';

  @override
  IconData get icon => FontAwesomeIcons.tiktok;

  @override
  String get name => localeLang().tiktok;
}

class FacebookSocial extends SocialMediaType {
  const FacebookSocial(super.url);
  @override
  String get type => 'facebook';

  @override
  IconData get icon => FontAwesomeIcons.facebook;

  @override
  String get name => localeLang().facebook;
}

class InstagramSocial extends SocialMediaType {
  const InstagramSocial(super.url);
  @override
  String get type => 'instagram';

  @override
  IconData get icon => FontAwesomeIcons.instagram;

  @override
  String get name => localeLang().instagram;
}

class TelegramSocial extends SocialMediaType {
  const TelegramSocial(super.url);
  @override
  String get type => 'telegram';

  @override
  IconData get icon => FontAwesomeIcons.telegram;

  @override
  String get name => localeLang().Telegram;
}

class WhatsappSocial extends SocialMediaType {
  WhatsappSocial(String number)
      : super(
          'https://wa.me/${number.replaceAll("+", '').replaceAll(RegExp(r'[^\d+]'), '').trim()}',
        );

  @override
  String get type => 'whatsapp';

  @override
  IconData get icon => FontAwesomeIcons.whatsapp;

  @override
  String get name => localeLang().whatsapp;
}
