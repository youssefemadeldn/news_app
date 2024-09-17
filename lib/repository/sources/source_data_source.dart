import 'package:news_app/models/source_model.dart';

abstract class RemoteSourceDataSource {
  Future<SourceModel?> getSources(String categoryId);
}

abstract class LocalSourceDataSource {}

// abstract class CashSourceDataSource {}  
