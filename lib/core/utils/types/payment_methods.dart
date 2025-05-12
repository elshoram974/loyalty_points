abstract class PaymentMethod {
  final String image;
  final String title;

  void pay();

  const PaymentMethod({required this.image, required this.title});
}

class InstabayPayment extends PaymentMethod {
  const InstabayPayment({required super.image, required super.title});
  @override
  void pay() {
    print('Paying using Instabay');
  }
}

class WalletsPayment extends PaymentMethod {
  const WalletsPayment({required super.image, required super.title});
  @override
  void pay() {
    print('Paying using Digital Wallet');
  }
}
