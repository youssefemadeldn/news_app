import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/cubits/source_states.dart';

class DisplayNewsViewModelCubit extends Cubit<SourceStates> {
  DisplayNewsViewModelCubit() : super(SourceLoadingState());

  void getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await Api.getSources(categoryId);

      if (response.status != 'ok') {
        emit(SourceErrorState(errorMessage: response.message!));
      } else {
        emit(SourceSuccessState(sourceList: response.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(
          errorMessage: 'something went wrong, ${e.toString()}'));
    }
  }
}
