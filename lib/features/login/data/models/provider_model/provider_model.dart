import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../../../core/utils/models/image_full_url.dart';

class ProviderModel extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final dynamic custom;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ImageFullUrl? imageFullUrl;

  const ProviderModel({
    this.id,
    this.name,
    this.image,
    this.custom,
    this.createdAt,
    this.updatedAt,
    this.imageFullUrl,
  });

  factory ProviderModel.fromMap(Map<String, dynamic> data) => ProviderModel(
        id: int.tryParse("${data['id']}"),
        name: data['name'] as String?,
        image: data['image'] as String?,
        custom: data['custom'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        imageFullUrl: data['image_full_url'] == null
            ? null
            : ImageFullUrl.fromMap(
                data['image_full_url'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'custom': custom,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'image_full_url': imageFullUrl?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProviderModel].
  factory ProviderModel.fromJson(String data) {
    return ProviderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProviderModel] to a JSON string.
  String toJson() => json.encode(toMap());

  ProviderModel copyWith({
    int? id,
    String? name,
    String? image,
    dynamic custom,
    DateTime? createdAt,
    DateTime? updatedAt,
    ImageFullUrl? imageFullUrl,
  }) {
    return ProviderModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      custom: custom ?? this.custom,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imageFullUrl: imageFullUrl ?? this.imageFullUrl,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      image,
      custom,
      createdAt,
      updatedAt,
      imageFullUrl,
    ];
  }
}
