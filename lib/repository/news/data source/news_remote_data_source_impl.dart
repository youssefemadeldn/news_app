import 'package:news_app/apis/api.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/repository/news/base_news_data_source.dart';

class NewsRemoteDataSourceImpl implements BaseRemoteNewsDataSource {
  Api api;
  NewsRemoteDataSourceImpl({required this.api});
  @override
  Future<NewsModel?> getNewsBySourceId(String sourceId) async {
    var response = await api.getEverythingNews(sourceId);

    return response;
  }
}
