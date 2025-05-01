import 'dart:io';

import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/functions/show_my_snack_bar.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../domain/repositories/home_repositories.dart';

abstract class HomeController extends GetxController {
  HomeController();
  bool get isLoading;

  Future<void> getAllData();

  Future<void> updateFCMToken();

  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp(this.repo);
  final HomeRepositories repo;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  @override
  Future<void> getAllData() async {
    await Future.wait(
      [
        updateFCMToken(),
      ],
    );
  }
  @override
  Future<void> updateFCMToken() async {
    return handleResponseInController<void>(
      status: await repo.updateFCMTokenAndTopic(
        NotificationService.deviceToken ?? await NotificationService.getDeviceToken(),
      ),
      onSuccess: (_) {},
    );
  }








  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if (DateTime.now().difference(_back) < const Duration(seconds: 2)) {
      if (!AppInfo.isDebugMode) exit(0);
    }
    ShowMySnackBar.call(
      localeLang().pressAgainToExit,
      duration: const Duration(seconds: 2),
    );
    _back = DateTime.now();
  }
}
