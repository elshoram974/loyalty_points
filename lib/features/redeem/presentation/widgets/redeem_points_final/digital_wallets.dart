import 'parent_redeem_class.dart';

class DigitalWallets extends ParentRedeem {
  DigitalWallets({required super.image, required super.title});
  void pay() {
    print('Paying using Digital Wallet');
  }
}