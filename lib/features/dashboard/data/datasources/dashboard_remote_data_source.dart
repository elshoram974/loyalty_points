import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../../auth/data/models/user_model.dart';

abstract class DashboardRemoteDataSource {
  const DashboardRemoteDataSource();
  Future<void> updateFCMTokenAndAddAllUsersTopic(String? fcmToken);
  Future<UserModel> getCurrentUser();
}

class DashboardRemoteDataSourceImp extends DashboardRemoteDataSource {
  const DashboardRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<void> updateFCMTokenAndAddAllUsersTopic(String? fcmToken) async {
    if (fcmToken == null) {
      await Future.wait(
        [
          fcm.unsubscribeFromTopic(AppString.allUsers),
          apiServices.post(AppLinks.updateFCMToken, null),
        ],
      );
    } else {
      await Future.wait(
        [
          fcm.subscribeToTopic(AppString.allUsers),
          apiServices.post(
            AppLinks.updateFCMToken,
            {AppString.fcmToken: fcmToken},
          ),
        ],
      );
    }
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final Map<String, dynamic> res = await apiServices.get(AppLinks.user);
    log(res.toString());

    return UserModel.fromMap(res);
  }
}
