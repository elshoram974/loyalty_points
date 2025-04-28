import 'package:equatable/equatable.dart';

 abstract class AccountType extends Equatable{
  const AccountType();
  String get type;
  
  @override
  List<Object?> get props => [type];
}
class DeliveryManAccount extends AccountType{
  const DeliveryManAccount();
  @override
  String get type => 'Delivery';
}
class StoreAccount extends AccountType{
  const StoreAccount();
  @override
  String get type => 'store';
}