import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/cubits/new_cubit/news_state.dart';

class NewsWidgetViewModelCubit extends Cubit<NewsState> {
  NewsWidgetViewModelCubit(super.initialState);

  Future<void> getNewsBySourceId(String sourceId) async {
    try {
      var response = await Api.getEverythingNews(sourceId);

      if (response.status != 'ok') {
        emit(NewsErrorState(errorMessage: response.message!));
      } else {
        emit(NewsSuccessState(articles: response.articles!));
      }
    } catch (e) {
      emit(NewsErrorState(
          errorMessage: "something went wrong, ${e.toString()}"));
    }
  }
}
