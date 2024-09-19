import 'package:hive/hive.dart';
import 'package:news_app/models/source_model.dart';
import 'package:news_app/repository/sources/base_source_data_source.dart';

class SourceLocalDataSourceImpl implements BaseLocalSourceDataSource {
  @override
  Future<SourceModel> getSources(String categoryId) async {
    var box = await Hive.openBox('taps');

    var responseCache = SourceModel.fromJson(box.get(categoryId));

    return responseCache;
  }

  @override
  void saveSources(SourceModel? sourceModel, String category) async {
    var box = await Hive.openBox('taps');

    await box.put(category, sourceModel?.toJson());
    await box.close();
  }
}
