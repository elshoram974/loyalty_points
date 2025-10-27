import 'package:equatable/equatable.dart';

import '../../../../core/utils/models/image_full_url.dart';
import '../../../../core/utils/types/account_type.dart';

enum AccountStatusEnum { pending, active, cancelled }

class UserModel extends Equatable {
  final int id;
  final int providerId;
  final int pointsBalance;
  final String name;
  final String email;
  final String phone;
  final AccountStatusEnum status;
  final AccountType type;
  final String? address;
  final ImageFullUrl? image;
  final DateTime updatedAt;
  final DateTime createdAt;
  final DateTime? emailVerifiedAt;
  bool get isVerified => status == AccountStatusEnum.active;
  // bool get isVerified => emailVerifiedAt != null;

  const UserModel({
    required this.id,
    required this.providerId,
    required this.pointsBalance,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    required this.address,
    required this.image,
    required this.updatedAt,
    required this.createdAt,
    required this.emailVerifiedAt,
    required this.status,
  });

  factory UserModel.fromMap(Map json) => UserModel(
        id: int.parse("${json['id'] ?? -1}"),
        name: json['name'] as String,
        email: json['email'] as String,
        image: json['image_full_url'] == null
            ? null
            : ImageFullUrl.fromMap(json['image_full_url']),
        providerId: int.parse("${json['provider_id'] ?? -1}"),
        // pointsBalance: 50000,
        pointsBalance: int.parse("${json['points_balance'] ?? 0}"),
        phone: json['phone'] as String,
        type: AccountType.fromMap(json['type'] as String),
        status: AccountStatusEnum.values[int.parse("${json['status'] ?? 0}")],
        address: json['country'] as String?,
        updatedAt: DateTime.parse(json['updated_at'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        emailVerifiedAt: DateTime.tryParse(
            json['email_verified_at'] as String? ?? 'unKnown'),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'image_full_url': image?.toMap(),
        'provider_id': providerId,
        'points_balance': pointsBalance,
        'phone': phone,
        'type': type.type,
        'status': status.index,
        'country': address,
        'updated_at': updatedAt.toIso8601String(),
        'created_at': createdAt.toIso8601String(),
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
      };
  Map<String, String?> toClarity() => {
        'id': id.toString(),
        'name': name,
        'email': email,
        'image_link': image?.path,
        'provider_id': providerId.toString(),
        'points_balance': pointsBalance.toString(),
        'phone': phone,
        'type': type.type,
        'account_status': status.name,
        'country': address,
        'updated_at': updatedAt.toString(),
        'created_at': createdAt.toString(),
        'email_verified_at': emailVerifiedAt?.toString(),
        'is_verified': isVerified.toString(),
      };

  factory UserModel.empty() {
    return UserModel(
      id: -1,
      providerId: -1,
      pointsBalance: 0,
      name: 'name',
      email: 'email',
      phone: 'phone',
      type: const DeliveryManAccount(),
      status: AccountStatusEnum.active,
      address: 'address',
      image: null,
      updatedAt: DateTime.now(),
      createdAt: DateTime(2001),
      emailVerifiedAt: null,
    );
  }

  UserModel copyWith({
    int? id,
    int? providerId,
    int? pointsBalance,
    String? name,
    String? email,
    String? phone,
    ImageFullUrl? image,
    AccountType? type,
    String? address,
    AccountStatusEnum? status,
    DateTime? updatedAt,
    DateTime? createdAt,
    DateTime? emailVerifiedAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      providerId: providerId ?? this.providerId,
      pointsBalance: pointsBalance ?? this.pointsBalance,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type ?? this.type,
      status: status ?? this.status,
      address: address ?? this.address,
      image: image ?? this.image,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      providerId,
      pointsBalance,
      name,
      email,
      phone,
      type,
      status,
      address,
      image,
      updatedAt,
      createdAt,
      emailVerifiedAt,
    ];
  }
}
