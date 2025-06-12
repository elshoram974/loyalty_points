import 'package:get/get.dart';

import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/models/pagination_model.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/repositories/dashboard_repositories.dart';

/// redeem requests history controller
abstract class OrdersController extends GetxController {
  OrdersController();
  bool get isInitialLoading;
  bool get isLoadingMore;

  bool get hasMoreItem;

  List<OrderEntity> get orders;

  /// Transaction history data
  Future<void> getOrders([bool isReload = false]);
  Future<void> getMoreOrders();
}

class OrdersControllerImp extends OrdersController {
  OrdersControllerImp(this.repo);
  final DashboardRepositories repo;
  int _page = 1;
  int _totalItems = 0;

  bool _isInitialLoading = true;
  @override
  bool get isInitialLoading => _isInitialLoading && _orders.isEmpty;

  bool _isLoadingMore = false;
  @override
  bool get isLoadingMore => _isLoadingMore;

  @override
  bool get hasMoreItem => _totalItems > _orders.length;

  final List<OrderEntity> _orders = [];
  @override
  List<OrderEntity> get orders => List.unmodifiable(_orders);

  @override
  Future<void> getMoreOrders() async {
    if (_isInitialLoading || _isLoadingMore || !hasMoreItem) return;

    _isLoadingMore = true;
    update();

    handleResponseInController<PaginationModel<OrderEntity>>(
      status: await repo.getOrders(++_page),
      onSuccess: (results) {
        _totalItems = results.totalItems;
        _orders.addAll(results.data);
      },
    );
    _isLoadingMore = false;
    update();
  }

  @override
  Future<void> getOrders([bool isReload = false]) async {
    _page = 1;
    if (!isReload) {
      _isInitialLoading = true;
      update();
    }

    handleResponseInController<PaginationModel<OrderEntity>>(
      status: await repo.getOrders(_page),
      onSuccess: (results) {
        _orders.clear();
        _totalItems = results.totalItems;
        _orders.addAll(results.data);
      },
    );
    _isInitialLoading = false;
    update();
  }
}
