import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../types/social_media_type.dart';

class ConfigModel extends Equatable {
  final dynamic pointsValue;
  final String? currency;
  final dynamic loyaltyEnabled;
  final String? banner2;
  final String? banner1;
  final int? sellerMinimumPointsToRedeem;
  final int? repMinimumPointsToRedeem;
  final int? sellerOnePoundEquity;
  final int? repOnePoundEquity;
  final List social;

  List<String> get homeBanners => [banner1, banner2].nonNulls.toList();
  List<SocialMediaType> get socialMedia {
    final List<SocialMediaType> socialMedia = [];

    for (Map e in social) {
      if(e.entries.isEmpty) continue;
      final SocialMediaType? type = SocialMediaType.fromType(e.keys.first, e.values.first);
      if(type != null) socialMedia.add(type);
    }
    return socialMedia;
  }

  const ConfigModel({
    this.pointsValue,
    this.currency,
    this.loyaltyEnabled,
    this.banner2,
    this.banner1,
    this.sellerMinimumPointsToRedeem,
    this.repMinimumPointsToRedeem,
    this.sellerOnePoundEquity,
    this.repOnePoundEquity,
    this.social = const [],
  });

  factory ConfigModel.fromMap(Map<String, dynamic> data) {

    return ConfigModel(
      social: (data['social'] as List? ?? []),
      pointsValue: data['points_value'] as dynamic,
      currency: data['currency']?['code'] as String?,
      loyaltyEnabled: data['loyalty_enabled'] as dynamic,
      banner2: data['banner2'] as String?,
      banner1: data['banner1'] as String?,
      sellerMinimumPointsToRedeem:
          data['seller_minimum_points_to_redeem'] as int?,
      repMinimumPointsToRedeem: data['rep_minimum_points_to_redeem'] as int?,
      sellerOnePoundEquity: data['seller_one_pound_equity'] as int?,
      repOnePoundEquity: data['rep_one_pound_equity'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'social': social,
      'points_value': pointsValue,
      'currency': currency,
      'loyalty_enabled': loyaltyEnabled,
      'banner2': banner2,
      'banner1': banner1,
      'seller_minimum_points_to_redeem': sellerMinimumPointsToRedeem,
      'rep_minimum_points_to_redeem': repMinimumPointsToRedeem,
      'seller_one_pound_equity': sellerOnePoundEquity,
      'rep_one_pound_equity': repOnePoundEquity,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ConfigModel].
  factory ConfigModel.fromJson(String data) {
    return ConfigModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ConfigModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ConfigModel copyWith({
    dynamic pointsValue,
    String? currency,
    dynamic loyaltyEnabled,
    String? banner2,
    String? banner1,
    int? sellerMinimumPointsToRedeem,
    int? repMinimumPointsToRedeem,
    int? sellerOnePoundEquity,
    int? repOnePoundEquity,
  }) {
    return ConfigModel(
      pointsValue: pointsValue ?? this.pointsValue,
      currency: currency ?? this.currency,
      loyaltyEnabled: loyaltyEnabled ?? this.loyaltyEnabled,
      banner2: banner2 ?? this.banner2,
      banner1: banner1 ?? this.banner1,
      sellerMinimumPointsToRedeem:
          sellerMinimumPointsToRedeem ?? this.sellerMinimumPointsToRedeem,
      repMinimumPointsToRedeem:
          repMinimumPointsToRedeem ?? this.repMinimumPointsToRedeem,
      sellerOnePoundEquity: sellerOnePoundEquity ?? this.sellerOnePoundEquity,
      repOnePoundEquity: repOnePoundEquity ?? this.repOnePoundEquity,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      pointsValue,
      currency,
      loyaltyEnabled,
      banner2,
      banner1,
      sellerMinimumPointsToRedeem,
      repMinimumPointsToRedeem,
      sellerOnePoundEquity,
      repOnePoundEquity,
    ];
  }
}