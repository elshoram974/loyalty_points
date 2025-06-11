import 'package:get/get.dart';

import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../domain/entity/points_entity.dart';
import '../../domain/repositories/dashboard_repositories.dart';

/// Transaction history controller
abstract class PointsController extends GetxController {
  PointsController();
  bool get isInitialLoading;
  bool get isLoadingMore;

  List<PointsEntity> get points;

  /// Transaction history data
  Future<void> getPoints([bool isReload = false]);
  Future<void> getMorePoints();
}

class PointsControllerImp extends PointsController {
  PointsControllerImp(this.repo);
  final DashboardRepositories repo;
  int _page = 1;

  bool _isInitialLoading = true;
  @override
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  @override
  bool get isLoadingMore => _isLoadingMore;

  final List<PointsEntity> _points = [];
  @override
  List<PointsEntity> get points => List.unmodifiable(_points);

  @override
  Future<void> getMorePoints() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    update();

    handleResponseInController<List<PointsEntity>>(
      status: await repo.getPoints(++_page),
      onSuccess: (results) => _points.addAll(results),
    );
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

    handleResponseInController<List<PointsEntity>>(
      status: await repo.getPoints(_page),
      onSuccess: (results) {
        _points.clear();
        _points.addAll(results);
      },
    );
    _isInitialLoading = false;
    update();
  }
}
