import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageFullUrl extends Equatable {
  final String? key;
  final String? path;
  final int? status;

  const ImageFullUrl({this.key, this.path, this.status});

  factory ImageFullUrl.fromMap(Map data) => ImageFullUrl(
        key: data['key'] as String?,
        path: data['path'] as String?,
        status: data['status'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'key': key,
        'path': path,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ImageFullUrl].
  factory ImageFullUrl.fromJson(String data) {
    return ImageFullUrl.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ImageFullUrl] to a JSON string.
  String toJson() => json.encode(toMap());

  ImageFullUrl copyWith({
    String? key,
    String? path,
    int? status,
  }) {
    return ImageFullUrl(
      key: key ?? this.key,
      path: path ?? this.path,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [key, path, status];
}
