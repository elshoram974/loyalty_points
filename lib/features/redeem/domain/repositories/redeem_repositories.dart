import '../../../../core/status/status.dart';
import '../entities/redeem_entity.dart';

abstract class RedeemRepositories {
  const RedeemRepositories();

  Future<Status<void>> createRedeem(RedeemEntity data);
}
