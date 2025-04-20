abstract class AccountType{
  const AccountType();
  String get type;
}
class DeliveryManAccount implements AccountType{
  const DeliveryManAccount();
  @override
  String get type => 'Delivery';
}
class StoreAccount implements AccountType{
  const StoreAccount();
  @override
  String get type => 'store';
}