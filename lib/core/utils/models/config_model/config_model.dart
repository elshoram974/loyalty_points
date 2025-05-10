import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'currency.dart';
import 'language.dart';
import 'push_notification_service_file_content.dart';

class ConfigModel extends Equatable {
  final dynamic pointsValue;
  final Currency? currency;
  final dynamic loyaltyEnabled;
  final String? banner2;
  final Language? language;
  final String? banner1;
  final int? sellerMinimumPointsToRedeem;
  final int? repMinimumPointsToRedeem;
  final int? sellerOnePoundEquity;
  final int? repOnePoundEquity;
  final PushNotificationServiceFileContent? pushNotificationServiceFileContent;

  const ConfigModel({
    this.pointsValue,
    this.currency,
    this.loyaltyEnabled,
    this.banner2,
    this.language,
    this.banner1,
    this.sellerMinimumPointsToRedeem,
    this.repMinimumPointsToRedeem,
    this.sellerOnePoundEquity,
    this.repOnePoundEquity,
    this.pushNotificationServiceFileContent,
  });

  factory ConfigModel.fromMap(Map<String, dynamic> data) => ConfigModel(
        pointsValue: data['points_value'] as dynamic,
        currency: data['currency'] == null
            ? null
            : Currency.fromMap(data['currency'] as Map<String, dynamic>),
        loyaltyEnabled: data['loyalty_enabled'] as dynamic,
        banner2: data['banner2'] as String?,
        language: data['language'] == null
            ? null
            : Language.fromMap(data['language'] as Map<String, dynamic>),
        banner1: data['banner1'] as String?,
        sellerMinimumPointsToRedeem:
            data['seller_minimum_points_to_redeem'] as int?,
        repMinimumPointsToRedeem: data['rep_minimum_points_to_redeem'] as int?,
        sellerOnePoundEquity: data['seller_one_pound_equity'] as int?,
        repOnePoundEquity: data['rep_one_pound_equity'] as int?,
        pushNotificationServiceFileContent:
            data['push_notification_service_file_content'] == null
                ? null
                : PushNotificationServiceFileContent.fromMap(
                    data['push_notification_service_file_content']
                        as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'points_value': pointsValue,
        'currency': currency?.toMap(),
        'loyalty_enabled': loyaltyEnabled,
        'banner2': banner2,
        'language': language?.toMap(),
        'banner1': banner1,
        'seller_minimum_points_to_redeem': sellerMinimumPointsToRedeem,
        'rep_minimum_points_to_redeem': repMinimumPointsToRedeem,
        'seller_one_pound_equity': sellerOnePoundEquity,
        'rep_one_pound_equity': repOnePoundEquity,
        'push_notification_service_file_content':
            pushNotificationServiceFileContent?.toMap(),
      };

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
    Currency? currency,
    dynamic loyaltyEnabled,
    String? banner2,
    Language? language,
    String? banner1,
    int? sellerMinimumPointsToRedeem,
    int? repMinimumPointsToRedeem,
    int? sellerOnePoundEquity,
    int? repOnePoundEquity,
    PushNotificationServiceFileContent? pushNotificationServiceFileContent,
  }) {
    return ConfigModel(
      pointsValue: pointsValue ?? this.pointsValue,
      currency: currency ?? this.currency,
      loyaltyEnabled: loyaltyEnabled ?? this.loyaltyEnabled,
      banner2: banner2 ?? this.banner2,
      language: language ?? this.language,
      banner1: banner1 ?? this.banner1,
      sellerMinimumPointsToRedeem:
          sellerMinimumPointsToRedeem ?? this.sellerMinimumPointsToRedeem,
      repMinimumPointsToRedeem:
          repMinimumPointsToRedeem ?? this.repMinimumPointsToRedeem,
      sellerOnePoundEquity: sellerOnePoundEquity ?? this.sellerOnePoundEquity,
      repOnePoundEquity: repOnePoundEquity ?? this.repOnePoundEquity,
      pushNotificationServiceFileContent: pushNotificationServiceFileContent ??
          this.pushNotificationServiceFileContent,
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
      language,
      banner1,
      sellerMinimumPointsToRedeem,
      repMinimumPointsToRedeem,
      sellerOnePoundEquity,
      repOnePoundEquity,
      pushNotificationServiceFileContent,
    ];
  }
}
