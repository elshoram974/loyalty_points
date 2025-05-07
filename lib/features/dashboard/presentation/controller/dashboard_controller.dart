import 'dart:io';

import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/status/status.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/config/routes/routes.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/functions/handle_response_in_controller.dart';
import '../../../../core/utils/functions/show_my_dialog.dart';
import '../../../../core/utils/functions/show_my_snack_bar.dart';
import '../../../../core/utils/services/push_notification_service.dart';
import '../../../auth/data/models/user_model.dart';
import '../../domain/repositories/home_repositories.dart';

const int _initSelectedPage = 0;

abstract class DashboardController extends GetxController {
  DashboardController();
  bool get isLoadingUserData;

  UserModel get user;

  int get selectedScreen;
  void changeHomeScreen(int selected);

  Future<void> getAllData();

  Future<void> updateFCMToken();

  Future<void> getUserData();

  Future<void> logOut();

  void onPopInvoked();
}

class DashboardControllerImp extends DashboardController {
  DashboardControllerImp(this.repo);
  final HomeRepositories repo;

  bool _isLoadingUserData = false;

  @override
  bool get isLoadingUserData => _isLoadingUserData;

  UserModel? _user;

  @override
  UserModel get user => _user ?? UserModel.empty();

  int _selectedScreen = _initSelectedPage;
  @override
  int get selectedScreen => _selectedScreen;

  @override
  void changeHomeScreen(int selected) {
    _selectedScreen = selected;
    update([AppString.updateSelectedScreen]);
  }

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
        getUserData(),
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

  @override
  Future<void> getUserData() async {
    Status<UserModel?>? realStatus;
    _isLoadingUserData = true;
    update([AppString.updateHomeUser]);

    repo.getUserData().listen(
      (status) {
        if (status is Success<UserModel?>) {
          realStatus ??= status;
          _user = status.data;
          _isLoadingUserData = true;
          update([AppString.updateHomeUser]);
        } else {
          realStatus = status;
        }
      },
      onDone: () {
        if (realStatus is Failure<UserModel?>) {
          handleFailureStatus(realStatus as Failure<UserModel>);
        }

        print("onDone");
      },
    );
  }

  @override
  Future<void> logOut() async {
    return ShowMyDialog.loading(
      () async => await handleResponseInController<void>(
        status: await repo.logout(),
        onSuccess: (_) {
          Get.offAllNamed(AppRoute.login);
        },
      ),
    );
  }

  DateTime _back = DateTime.now();
  @override
  void onPopInvoked() {
    if (_selectedScreen != _initSelectedPage) {
      return changeHomeScreen(_initSelectedPage);
    }

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
