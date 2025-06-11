import 'package:loyalty_points/features/dashboard/domain/entity/points_entity.dart';

import '../../../../core/status/status.dart';
import '../../domain/repositories/points_repositories.dart';

class PointsRepositoriesImp extends PointsRepositories {
  const PointsRepositoriesImp();

  @override
  Future<Status<List<PointsEntity>>> getPoints(int page) {
    // return executeAndHandleErrors<void>(
    //   () => remoteDataSource.scanCode(code),
    // );
    // TODO: implement getPoints
    throw UnimplementedError();
  }
}
