import 'dart:convert';

import '../../../../core/utils/models/image_full_url.dart';
import '../../../../core/utils/types/order_status_enum.dart';
import '../../../../core/utils/types/payment_methods.dart';
import '../../domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final int? id;
  final int? userId;
  final String? paymentMethodString;
  final String? paymentInfo;
  final String? paymentRef;
  final String? status;
  final String? noteBy;
  final String? equity;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final ImageFullUrl? imageFullUrl;

  OrderModel({
    this.id,
    this.userId,
    super.points = 0,
    this.paymentMethodString,
    this.paymentInfo,
    this.paymentRef,
    this.status,
    super.adminNote,
    this.noteBy,
    this.equity,
    this.createdAt,
    this.updatedAt,
    this.imageFullUrl,
  }) : super(
          orderStatus: OrderStatusEnum.fromString(status),
          price: double.tryParse("$equity") ?? 0,
          createdDate: createdAt ?? DateTime.now(),
          updatedDate: updatedAt,
          phone: paymentInfo ?? '',
          paymentMethod: PaymentMethod.fromString(paymentMethodString),
          imageUrl: imageFullUrl?.path,
        );

  factory OrderModel.fromMap(Map<String, dynamic> data) => OrderModel(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        points: data['points'] as int? ?? 0,
        paymentMethodString: data['payment_method'] as String?,
        paymentInfo: data['payment_info'] as String?,
        paymentRef: data['payment_ref'] as String?,
        status: data['status'] as String?,
        adminNote: data['admin_note'] as String?,
        noteBy: data['note_by'] as String?,
        equity: data['equity'] as String?,
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
        'user_id': userId,
        'points': points,
        'payment_method': paymentMethodString,
        'payment_info': paymentInfo,
        'payment_ref': paymentRef,
        'status': status,
        'admin_note': adminNote,
        'note_by': noteBy,
        'equity': equity,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'image_full_url': imageFullUrl?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderModel].
  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrderModel copyWith({
    int? id,
    int? userId,
    int? points,
    String? paymentMethodString,
    String? paymentInfo,
    String? paymentRef,
    String? status,
    String? adminNote,
    String? noteBy,
    String? equity,
    DateTime? createdAt,
    DateTime? updatedAt,
    ImageFullUrl? imageFullUrl,
  }) {
    return OrderModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      points: points ?? this.points,
      paymentMethodString: paymentMethodString ?? this.paymentMethodString,
      paymentInfo: paymentInfo ?? this.paymentInfo,
      paymentRef: paymentRef ?? this.paymentRef,
      status: status ?? this.status,
      adminNote: adminNote ?? this.adminNote,
      noteBy: noteBy ?? this.noteBy,
      equity: equity ?? this.equity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      imageFullUrl: imageFullUrl ?? this.imageFullUrl,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      points,
      paymentMethodString,
      paymentInfo,
      paymentRef,
      status,
      adminNote,
      noteBy,
      equity,
      createdAt,
      updatedAt,
      imageFullUrl,
    ];
  }
}
