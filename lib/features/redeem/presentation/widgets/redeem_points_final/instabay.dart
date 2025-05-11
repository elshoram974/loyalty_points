import 'parent_redeem_class.dart';

class Instabay extends ParentRedeem {
  Instabay({required super.image, required super.title});
   void pay() {
    print('Paying using Instabay');
  }
}