import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_info.dart';
import '../../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../../../features/auth/domain/repositories/auth_repositories.dart';
import '../config/controller/config_controller.dart';
import '../config/locale/generated/l10n.dart';
import '../constants/app_strings.dart';
import '../services/api_services.dart';
import '../config/controller/config_datasource.dart';

abstract final class InitialBindings {
  const InitialBindings();

  static Future<void> dependencies() async {
    Get.put<AppLocalizationDelegate>(const AppLocalizationDelegate());

    Get.put<FlutterSecureStorage>(const FlutterSecureStorage());

    Get.put<Dio>(Dio(BaseOptions(baseUrl: AppInfo.baseURL)));

    Get.put<APIServices>(
      APIServices(
        Get.find<Dio>(),
        Get.find<FlutterSecureStorage>(),
      ),
    );
    await Future.wait([
      Get.putAsync(() => Hive.openBox<Map>(AppString.kUserBox)),
      Get.putAsync<SharedPreferences>(SharedPreferences.getInstance),
    ]);

    Get.put<ConfigRemoteDataSource>(
      ConfigRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<ConfigController>(
      ConfigControllerImp(
        prefs: Get.find<SharedPreferences>(),
        dataSource: Get.find<ConfigRemoteDataSource>(),
      ),
    );
    Get.put<AuthLocalDataSource>(
      AuthLocalDataSourceImp(
        Get.find(),
        Get.find<FlutterSecureStorage>(),
      ),
    );
    Get.put<AuthRemoteDataSource>(
      AuthRemoteDataSourceImp(Get.find<APIServices>()),
    );

    Get.put<AuthRepositories>(
      AuthRepositoriesImp(
        localDataSource: Get.find<AuthLocalDataSource>(),
        remoteDataSource: Get.find<AuthRemoteDataSource>(),
      ),
    );
    Get.find<ConfigRemoteDataSource>()();
  }
}
