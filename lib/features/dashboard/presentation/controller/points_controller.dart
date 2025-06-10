import 'package:get/get.dart';

import '../../domain/entity/points_entity.dart';

/// Transaction history controller
abstract class PointsController extends GetxController {
  PointsController();
  bool get isInitialLoading;
  bool get isLoadingMore;

  List<PointsEntity> get points;

  /// Transaction history data
  Future<void> getPoints();
  Future<void> getMorePoints();
}

class PointsControllerImp extends PointsController {
  PointsControllerImp();

  bool _isInitialLoading = true;

  @override
  bool get isInitialLoading => _isInitialLoading;

  bool _isLoadingMore = false;
  @override
  bool get isLoadingMore => _isLoadingMore;

  List<PointsEntity> _points = [];
  @override
  List<PointsEntity> get points => List.unmodifiable(_points);

  @override
  Future<void> getMorePoints() async {
    // TODO: implement getMorePoints
  }

  @override
  Future<void> getPoints() async {
    // TODO: implement getPoints
  }
}
