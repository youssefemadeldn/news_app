import 'package:news_app/models/news_model.dart';

abstract class BaseNewsRepository {
  Future<NewsModel?> getNewsBySourceId(String sourceId);
}
