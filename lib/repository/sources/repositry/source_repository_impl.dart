import 'package:news_app/models/source_model.dart';
import 'package:news_app/repository/sources/base_source_data_source.dart';
import 'package:news_app/repository/sources/base_source_repository.dart';

class SourceRepositoryImpl implements BaseSourceRepository {
  BaseRemoteSourceDataSource baseRemoteSourceDataSource;

  SourceRepositoryImpl({required this.baseRemoteSourceDataSource});
  @override
  Future<SourceModel?> getSources(String categoryId) {
    var response = baseRemoteSourceDataSource.getSources(categoryId);

    return response;
  }
}
