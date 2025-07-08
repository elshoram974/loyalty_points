import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../app_info.dart';
import '../types/account_type.dart';
import '../types/social_media_type.dart';

class ConfigModel extends Equatable {
  final dynamic pointsValue;
  final String? currency;
  final dynamic loyaltyEnabled;
  final String? banner4;
  final String? banner3;
  final String? banner2;
  final String? banner1;
  final String? loginIntro;
  final String? burnStepsHTML;
  final bool useLocalAuth;

  final int? _sellerMinimumPointsToRedeem;
  final int? _repMinimumPointsToRedeem;
  final int? _sellerOnePoundEquity;
  final int? _repOnePoundEquity;
  final List _social;

  int? onePoundEquity(AccountType type) {
    return _handleAccountTypeValues<int>(
      type,
      store: _sellerOnePoundEquity,
      rep: _repOnePoundEquity,
    );
  }

  int? oneMinimumPointsToRedeem(AccountType type) {
    return _handleAccountTypeValues<int>(
      type,
      store: _sellerMinimumPointsToRedeem,
      rep: _repMinimumPointsToRedeem,
    );
  }

  T? _handleAccountTypeValues<T>(AccountType type, {T? store, T? rep}) {
    if (type is StoreAccount) {
      return store;
    } else if (type is DeliveryManAccount) {
      return rep;
    }
    return null;
  }

  List<String> get homeBanners => [
        banner1,
        banner2,
        banner3,
        banner4,
      ].nonNulls.toList();
  List<SocialMediaType> get socialMedia {
    final List<SocialMediaType> socialMedia = [];

    for (Map e in _social) {
      if (e.entries.isEmpty) continue;

      final SocialMediaType? type =
          SocialMediaType.fromType(e.keys.first, e.values.first);

      if (type != null) socialMedia.add(type);
    }
    return socialMedia;
  }

  const ConfigModel({
    this.pointsValue,
    this.currency,
    this.loyaltyEnabled,
    this.burnStepsHTML,
    this.banner4,
    this.banner3,
    this.banner2,
    this.banner1,
    this.loginIntro,
    this.useLocalAuth = true,
    int? sellerMinimumPointsToRedeem,
    int? repMinimumPointsToRedeem,
    int? sellerOnePoundEquity,
    int? repOnePoundEquity,
    List<dynamic> social = const [],
  })  : _repOnePoundEquity = repOnePoundEquity,
        _sellerOnePoundEquity = sellerOnePoundEquity,
        _repMinimumPointsToRedeem = repMinimumPointsToRedeem,
        _sellerMinimumPointsToRedeem = sellerMinimumPointsToRedeem,
        _social = social;

  factory ConfigModel.fromMap(Map<String, dynamic> data) {
    return ConfigModel(
      social: (data['social'] as List? ?? []),
      pointsValue: data['points_value'] as dynamic,
      currency: data['currency']?['code'] as String?,
      loyaltyEnabled: data['loyalty_enabled'] as dynamic,
      burnStepsHTML: data['burn_steps_html'] as String?,
      banner4: data['banner4'] as String?,
      banner3: data['banner3'] as String?,
      banner2: data['banner2'] as String?,
      banner1: data['banner1'] as String?,
      sellerMinimumPointsToRedeem:
          data['seller_minimum_points_to_redeem'] as int?,
      repMinimumPointsToRedeem: data['rep_minimum_points_to_redeem'] as int?,
      sellerOnePoundEquity: data['seller_one_pound_equity'] as int?,
      repOnePoundEquity: data['rep_one_pound_equity'] as int?,
      loginIntro: data['login_intro'] as String?,
      useLocalAuth: AppInfo.useLocalAuth,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'social': _social,
      'points_value': pointsValue,
      'currency': currency,
      'loyalty_enabled': loyaltyEnabled,
      'burn_steps_html': burnStepsHTML,
      'banner4': banner4,
      'banner3': banner3,
      'banner2': banner2,
      'banner1': banner1,
      'seller_minimum_points_to_redeem': _sellerMinimumPointsToRedeem,
      'rep_minimum_points_to_redeem': _repMinimumPointsToRedeem,
      'seller_one_pound_equity': _sellerOnePoundEquity,
      'rep_one_pound_equity': _repOnePoundEquity,
      'login_intro': loginIntro,
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
    String? burnStepsHTML,
    String? banner4,
    String? banner3,
    String? banner2,
    String? banner1,
    int? sellerMinimumPointsToRedeem,
    int? repMinimumPointsToRedeem,
    int? sellerOnePoundEquity,
    int? repOnePoundEquity,
    List<dynamic>? social,
    String? loginIntro,
  }) {
    return ConfigModel(
      pointsValue: pointsValue ?? this.pointsValue,
      currency: currency ?? this.currency,
      loyaltyEnabled: loyaltyEnabled ?? this.loyaltyEnabled,
      burnStepsHTML: burnStepsHTML ?? this.burnStepsHTML,
      banner4: banner4 ?? this.banner4,
      banner3: banner3 ?? this.banner3,
      banner2: banner2 ?? this.banner2,
      banner1: banner1 ?? this.banner1,
      sellerMinimumPointsToRedeem:
          sellerMinimumPointsToRedeem ?? _sellerMinimumPointsToRedeem,
      repMinimumPointsToRedeem:
          repMinimumPointsToRedeem ?? _repMinimumPointsToRedeem,
      sellerOnePoundEquity: sellerOnePoundEquity ?? _sellerOnePoundEquity,
      repOnePoundEquity: repOnePoundEquity ?? _repOnePoundEquity,
      social: social ?? _social,
      loginIntro: loginIntro ?? this.loginIntro,
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
      burnStepsHTML,
      banner4,
      banner3,
      banner2,
      banner1,
      _sellerMinimumPointsToRedeem,
      _repMinimumPointsToRedeem,
      _sellerOnePoundEquity,
      _repOnePoundEquity,
      _social,
      loginIntro,
    ];
  }
}
