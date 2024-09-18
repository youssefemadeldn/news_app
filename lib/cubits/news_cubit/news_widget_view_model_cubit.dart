import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/cubits/news_cubit/news_state.dart';
import 'package:news_app/repository/news/base_news_data_source.dart';
import 'package:news_app/repository/news/base_news_repository.dart';
import 'package:news_app/repository/news/data%20source/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';

class NewsWidgetViewModelCubit extends Cubit<NewsState> {
  late BaseNewsRepository baseNewsRepository;
  late BaseRemoteNewsDataSource baseRemoteNewsDataSource;
  late Api api;
  NewsWidgetViewModelCubit(super.initialState) {
    api = Api();
    baseRemoteNewsDataSource = NewsRemoteDataSourceImpl(api: api);
    baseNewsRepository =
        NewsRepositoryImpl(baseRemoteNewsDataSource: baseRemoteNewsDataSource);
  }

  Future<void> getNewsBySourceId(String sourceId) async {
    try {
      var response = await baseNewsRepository.getNewsBySourceId(sourceId);

      if (response?.status != 'ok') {
        emit(NewsErrorState(errorMessage: response!.message!));
      } else {
        emit(NewsSuccessState(articles: response!.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(
          errorMessage: "something went wrong, ${e.toString()}"));
    }
  }
}
