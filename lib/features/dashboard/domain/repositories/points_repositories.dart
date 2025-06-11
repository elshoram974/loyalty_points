import '../../../../core/status/status.dart';
import '../entity/points_entity.dart';

abstract class PointsRepositories {
  const PointsRepositories();

  Future<Status<List<PointsEntity>>> getPoints(int page);
}
