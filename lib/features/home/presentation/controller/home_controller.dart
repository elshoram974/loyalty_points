import 'dart:io';

import 'package:get/get.dart';

import '../../../../app_info.dart';
import '../../../../core/utils/config/locale/local_lang.dart';
import '../../../../core/utils/functions/show_my_snack_bar.dart';
import '../../domain/repositories/home_repositories.dart';

abstract class HomeController extends GetxController {
  bool get isLoading;


  void onPopInvoked();
}

class HomeControllerImp extends HomeController {
  HomeControllerImp(this._repo);
  final HomeRepositories _repo;

  bool _isLoading = false;

  @override
  bool get isLoading => _isLoading;



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
