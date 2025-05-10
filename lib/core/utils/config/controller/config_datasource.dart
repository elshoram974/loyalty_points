
import '../../../../../core/utils/constants/app_links.dart';
import '../../../../../core/utils/services/api_services.dart';
import '../../models/config_model.dart';

abstract class ConfigRemoteDataSource {
  const ConfigRemoteDataSource();
  Future<ConfigModel> call();
}

class ConfigRemoteDataSourceImp extends ConfigRemoteDataSource {
  const ConfigRemoteDataSourceImp(this.apiServices);
  final APIServices apiServices;

  @override
  Future<ConfigModel> call() async {
    final Map<String, dynamic> data = await apiServices.get(AppLinks.config);
    return ConfigModel.fromMap(data['data']);
  }
}
