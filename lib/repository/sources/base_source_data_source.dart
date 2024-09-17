import 'package:news_app/models/source_model.dart';

abstract class BaseRemoteSourceDataSource {
  Future<SourceModel?> getSources(String categoryId);
}

abstract class BaseLocalSourceDataSource {}

// abstract class CashSourceDataSource {}  
