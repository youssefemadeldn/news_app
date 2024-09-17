import 'package:news_app/apis/api.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/repository/sources/base_source_data_source.dart';

class SourceRemoteDataSourceImp implements BaseRemoteSourceDataSource {
  Api api;

  SourceRemoteDataSourceImp({required this.api});
  @override
  Future<SourceModel?> getSources(String categoryId) async {
    var response = await api.getSources(categoryId);

    return response;
  }
}
