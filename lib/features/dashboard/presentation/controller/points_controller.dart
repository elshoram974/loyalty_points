import 'package:get/get.dart';

import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/models/pagination_model.dart';
import '../../domain/entity/points_entity.dart';
import '../../domain/repositories/dashboard_repositories.dart';

/// Transaction history controller
abstract class PointsController extends GetxController {
  PointsController();
  bool get isInitialLoading;
  bool get isLoadingMore;

  bool get hasMoreItem;

  List<PointsEntity> get points;

  /// Transaction history data
  Future<void> getPoints([bool isReload = false]);
  Future<void> getMorePoints();
}

class PointsControllerImp extends PointsController {
  PointsControllerImp(this.repo);
  final DashboardRepositories repo;
  int _page = 1;
  int _totalItems = 0;

  bool _isInitialLoading = true;
  @override
  bool get isInitialLoading => _isInitialLoading && _points.isEmpty;

  bool _isLoadingMore = false;
  @override
  bool get isLoadingMore => _isLoadingMore;

  @override
  bool get hasMoreItem => _totalItems > _points.length;

  final List<PointsEntity> _points = [];
  @override
  List<PointsEntity> get points => List.unmodifiable(_points);

  @override
  Future<void> getMorePoints() async {
    if (_isInitialLoading || _isLoadingMore || !hasMoreItem) return;

    _isLoadingMore = true;
    update();

    handleResponseInController<PaginationModel<PointsEntity>>(
      status: await repo.getPoints(++_page),
      onSuccess: (results) {
        _totalItems = results.totalItems;
        _points.addAll(results.data);
      },
    );
    _totalItems = _points.length;
    _isLoadingMore = false;
    update();
  }

  @override
  Future<void> getPoints([bool isReload = false]) async {
    _page = 1;
    if (!isReload) {
      _isInitialLoading = true;
      update();
    }

    handleResponseInController<PaginationModel<PointsEntity>>(
      status: await repo.getPoints(_page),
      onSuccess: (results) {
        _points.clear();
        _totalItems = results.totalItems;
        _points.addAll(results.data);
      },
    );
    _isInitialLoading = false;
    update();
  }
}
