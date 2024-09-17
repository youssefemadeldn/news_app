import 'package:news_app/models/news_model.dart';

abstract class BaseRemoteNewsDataSource {
  Future<NewsModel?> getNewsBySourceId(String sourceId);
}

abstract class BaseLocaleNewsDataSource {}

abstract class BaseLocaleCacheDataSource {}
