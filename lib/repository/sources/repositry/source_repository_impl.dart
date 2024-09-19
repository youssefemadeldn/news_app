import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/repository/sources/base_source_data_source.dart';
import 'package:news_app/repository/sources/base_source_repository.dart';

class SourceRepositoryImpl implements BaseSourceRepository {
  BaseRemoteSourceDataSource baseRemoteSourceDataSource;
  BaseLocalSourceDataSource baseLocalSourceDataSource;

  SourceRepositoryImpl({
    required this.baseRemoteSourceDataSource,
    required this.baseLocalSourceDataSource,
  });
  @override
  Future<SourceModel?> getSources(String categoryId) async {
    var connectivityResult = await Connectivity().checkConnectivity();

    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.wifi ||
        // ignore: unrelated_type_equality_checks
        connectivityResult == ConnectivityResult.mobile) {
      var response = await baseRemoteSourceDataSource.getSources(categoryId);
      baseLocalSourceDataSource.saveSources(response, categoryId);

      return response;
    } else {
      var responseCache =
          await baseLocalSourceDataSource.getSources(categoryId);

      return responseCache;
    }
  }
}
