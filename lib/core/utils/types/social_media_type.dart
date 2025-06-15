import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

abstract class SocialMediaType extends Equatable {
  final String url;

  String get name;

  IconData get icon;

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
      if (t.name == type) return t;
    }
    return null;
  }

  const SocialMediaType(this.url);

  @override
  List<Object?> get props => [url, name, icon];
}

class TikTokSocial extends SocialMediaType {
  const TikTokSocial(super.url);
  @override
  String get name => 'tiktok';

  @override
  IconData get icon => FontAwesomeIcons.tiktok;
}

class FacebookSocial extends SocialMediaType {
  const FacebookSocial(super.url);
  @override
  String get name => 'facebook';

  @override
  IconData get icon => FontAwesomeIcons.facebook;
}

class InstagramSocial extends SocialMediaType {
  const InstagramSocial(super.url);
  @override
  String get name => 'instagram';

  @override
  IconData get icon => FontAwesomeIcons.instagram;
}

class TelegramSocial extends SocialMediaType {
  const TelegramSocial(super.url);
  @override
  String get name => 'telegram';

  @override
  IconData get icon => FontAwesomeIcons.telegram;
}

class WhatsappSocial extends SocialMediaType {
  WhatsappSocial(String number)
      : super(
          'https://wa.me/${number.replaceAll("+", '').replaceAll(RegExp(r'[^\d+]'), '').trim()}',
        );

  @override
  String get name => 'whatsapp';

  @override
  IconData get icon => FontAwesomeIcons.whatsapp;
}
