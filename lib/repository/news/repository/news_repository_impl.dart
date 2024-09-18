import 'package:news_app/models/news_model.dart';
import 'package:news_app/repository/news/base_news_data_source.dart';
import 'package:news_app/repository/news/base_news_repository.dart';

class NewsRepositoryImpl implements BaseNewsRepository {
  BaseRemoteNewsDataSource baseRemoteNewsDataSource;

  NewsRepositoryImpl({required this.baseRemoteNewsDataSource});
  @override
  Future<NewsModel?> getNewsBySourceId(String sourceId) async {
    var response = await baseRemoteNewsDataSource.getNewsBySourceId(sourceId);

    return response;
  }
}
