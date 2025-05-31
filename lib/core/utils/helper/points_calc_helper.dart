import 'package:loyalty_points/core/utils/extensions/num_ex.dart';

import '../../../features/auth/data/models/user_model.dart';
import '../models/config_model.dart';

final class PointsCalcHelper {
  final ConfigModel? config;
  final UserModel user;

  const PointsCalcHelper({required this.config, required this.user});

  /// How many points equal one pound, based on the [user]'s type.
  int? get pointPerPound => config?.onePoundEquity(user.type);
  String? get pointPerPoundString => pointPerPound?.withSeparator;

  /// Total user points that can be converted into currency.
  /// Any leftover points less than a full unit are discarded.
  int get convertiblePoints {
    if (pointPerPound == 0) return -1;
    return (user.pointsBalance - (user.pointsBalance % (pointPerPound ?? 1)))
        .abs();
  }

  String get convertiblePointsString => convertiblePoints.withSeparator;

  /// The amount in pounds that you get by converting [convertiblePoints].
  double get redeemableBalance {
    if (pointPerPound == 0 || pointPerPound == null) return 0;
    return convertiblePoints / pointPerPound!;
  }

  String get redeemableBalanceString => redeemableBalance.withSeparator;

  /// How many points remain after subtracting [convertiblePoints] from the [user]'s total.
  int get remainingPoints => (user.pointsBalance - convertiblePoints).abs();
  String get remainingPointsString => remainingPoints.withSeparator;

  /// The minimum number of points required to redeem once.
  int get minimumRedeemablePoints =>
      config?.oneMinimumPointsToRedeem(user.type) ?? 0;
  String get minimumRedeemablePointsString =>
      minimumRedeemablePoints.withSeparator;

  /// How many more points the user needs to reach [minimumRedeemablePoints].
  int get pointsShortfall => minimumRedeemablePoints - user.pointsBalance;
  String get pointsShortfallString => pointsShortfall.withSeparator;

  /// `true` if the [user] still needs additional points to redeem.
  bool get requiresMorePoints => pointsShortfall > 0;

  /// Returns [whenNeed] if [requiresMorePoints] == true, otherwise returns [whenNotNeed].
  T chooseBasedOnPointsNeed<T>(T whenNeed, T whenNotNeed) {
    return requiresMorePoints ? whenNeed : whenNotNeed;
  }
}
