import 'package:news_app/models/source_model.dart';

abstract class SourceRepositoryContract {
  Future<SourceModel> getSources(String categoryId);
}
