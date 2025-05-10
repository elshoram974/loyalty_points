import 'dart:convert';

import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String? code;

  const Language({this.code});

  factory Language.fromMap(Map<String, dynamic> data) => Language(
        code: data['code'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'code': code,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Language].
  factory Language.fromJson(String data) {
    return Language.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Language] to a JSON string.
  String toJson() => json.encode(toMap());

  Language copyWith({
    String? code,
  }) {
    return Language(
      code: code ?? this.code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code];
}
