import 'dart:convert';

import '../../../../core/utils/types/points_status_enum.dart';
import '../../domain/entity/points_entity.dart';

class PointsModel extends PointsEntity {
  final int? id;
  final int? userId;
  final int? qrCodeId;
  final String? type;
  final dynamic processedAt;
  final DateTime? createdAt;

  PointsModel({
    this.id,
    this.userId,
    this.qrCodeId,
    this.type,
    super.points = 0,
    super.description,
    this.processedAt,
    this.createdAt,
    super.updatedAt,
  }) : super(
          orderStatus: PointsStatusEnum.fromString(type),
          orderNumber: qrCodeId,
          date: createdAt ?? DateTime.now(),
        );

  factory PointsModel.fromMap(Map<String, dynamic> data) => PointsModel(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        qrCodeId: data['qr_code_id'] as int?,
        type: data['type'] as String?,
        points: (data['points'] as int?) ?? 0,
        description: data['description'] as String?,
        processedAt: data['processed_at'] as dynamic,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'qr_code_id': qrCodeId,
        'type': type,
        'points': points,
        'description': description,
        'processed_at': processedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PointsModel].
  factory PointsModel.fromJson(String data) {
    return PointsModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PointsModel] to a JSON string.
  String toJson() => json.encode(toMap());

  PointsModel copyWith({
    int? id,
    int? userId,
    int? qrCodeId,
    String? type,
    int? points,
    String? description,
    dynamic processedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PointsModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      qrCodeId: qrCodeId ?? this.qrCodeId,
      type: type ?? this.type,
      points: points ?? this.points,
      description: description ?? this.description,
      processedAt: processedAt ?? this.processedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      qrCodeId,
      type,
      points,
      description,
      processedAt,
      createdAt,
      updatedAt,
    ];
  }
}
