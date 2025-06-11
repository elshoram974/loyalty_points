import 'package:get/get.dart';

import '../../domain/entity/order_entity.dart';

/// Transaction history controller
abstract class OrdersController extends GetxController {
  OrdersController();
  bool get isInitialLoading;
  bool get isLoadingMore;

  List<OrderEntity> get orders;

  /// Transaction history data
  Future<void> getOrders();
  Future<void> getMoreOrders();
}

class OrdersControllerImp extends OrdersController {
  OrdersControllerImp();

  bool _isInitialLoading = true;

  @override
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  @override
  bool get isLoadingMore => _isLoadingMore;

  List<OrderEntity> _orders = [];
  @override
  List<OrderEntity> get orders => List.unmodifiable(_orders);

  @override
  Future<void> getMoreOrders() async {
    // TODO: implement getMoreOrders
  }

  @override
  Future<void> getOrders() async {
    // TODO: implement getOrders
  }
}
