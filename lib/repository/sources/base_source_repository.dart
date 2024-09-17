import 'package:news_app/models/source_model.dart';

abstract class BaseSourceRepository {
  Future<SourceModel?> getSources(String categoryId);
}
