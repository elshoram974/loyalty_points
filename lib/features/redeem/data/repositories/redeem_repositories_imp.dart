import 'package:loyalty_points/features/redeem/domain/entities/redeem_entity.dart';

import '../../../../core/status/status.dart';
import '../../../../core/utils/functions/execute_and_handle_remote_errors.dart';
import '../../domain/repositories/redeem_repositories.dart';
import '../datasources/redeem_data_source.dart';

class RedeemRepositoriesImp extends RedeemRepositories {
  const RedeemRepositoriesImp({required this.remoteDataSource});
  final RedeemRemoteDataSource remoteDataSource;

  @override
  Future<Status<void>> createRedeem(RedeemEntity data) {
    return executeAndHandleErrors<void>(
      () => remoteDataSource.createRedeem(data),
    );
  }
}
