import 'package:news_app/models/source_model.dart';

abstract class BaseRemoteSourceDataSource {
  Future<SourceModel?> getSources(String categoryId);
}

abstract class BaseLocalSourceDataSource {
  Future<SourceModel?> getSources(String categoryId);

  void saveSources(SourceModel? sourceModel);
}

// abstract class CashSourceDataSource {}  
