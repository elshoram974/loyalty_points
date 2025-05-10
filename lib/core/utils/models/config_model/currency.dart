import 'dart:convert';

import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String? code;

  const Currency({this.code});

  factory Currency.fromMap(Map<String, dynamic> data) => Currency(
        code: data['code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Currency].
  factory Currency.fromJson(String data) {
    return Currency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Currency] to a JSON string.
  String toJson() => json.encode(toMap());

  Currency copyWith({
    String? code,
  }) {
    return Currency(
      code: code ?? this.code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code];
}
