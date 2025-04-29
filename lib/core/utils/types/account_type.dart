import 'package:equatable/equatable.dart';

abstract class AccountType extends Equatable {
  const AccountType();
  String get type;

  static final List<AccountType> allTypes = List.unmodifiable(
    [
      const DeliveryManAccount(),
      const StoreAccount(),
    ],
  );

  factory AccountType.fromMap(String type) {
    for (AccountType t in allTypes) {
      if(type == t.type) return t;
    }
    return const DeliveryManAccount();
  }

  @override
  List<Object?> get props => [type];
}

class DeliveryManAccount extends AccountType {
  const DeliveryManAccount();
  @override
  String get type => 'rep';
}

class StoreAccount extends AccountType {
  const StoreAccount();
  @override
  String get type => 'seller';
}
