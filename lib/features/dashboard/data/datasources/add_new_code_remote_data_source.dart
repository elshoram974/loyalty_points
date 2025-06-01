import 'dart:developer';

import '../../../../core/utils/constants/app_links.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/services/api_services.dart';

abstract class AddNewCodeRemoteDataSource {
  const AddNewCodeRemoteDataSource();
  Future<void> scanCode(String code);
}

class AddNewCodeRemoteDataSourceImp extends AddNewCodeRemoteDataSource {
  const AddNewCodeRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<void> scanCode(String code) async {
    final Map<String, dynamic> res = await apiServices.post(
      AppLinks.scanCode,
      {AppString.code: code},
    );
    log(res.toString());
  }
}
