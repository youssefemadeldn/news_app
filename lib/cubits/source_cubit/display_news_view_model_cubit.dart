import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api.dart';
import 'package:news_app/cubits/source_cubit/source_states.dart';
import 'package:news_app/repository/sources/base_source_data_source.dart';
import 'package:news_app/repository/sources/base_source_repository.dart';
import 'package:news_app/repository/sources/data%20source/source_remote_data_source_imp.dart';
import 'package:news_app/repository/sources/repositry/source_repository_impl.dart';

class DisplayNewsViewModelCubit extends Cubit<SourceStates> {
  late BaseSourceRepository baseSourceRepository;
  late BaseRemoteSourceDataSource baseRemoteSourceDataSource;
  late Api api;
  DisplayNewsViewModelCubit() : super(SourceLoadingState()) {
    api = Api();
    baseRemoteSourceDataSource = SourceRemoteDataSourceImp(api: api);
    baseSourceRepository = SourceRepositoryImpl(
        baseRemoteSourceDataSource: baseRemoteSourceDataSource);
  }

  Future<void> getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await baseSourceRepository.getSources(categoryId);

      if (response?.status != 'ok') {
        emit(SourceErrorState(errorMessage: response?.message ?? 'empty'));
      } else {
        emit(SourceSuccessState(sourceList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(
          errorMessage: 'something went wrong, ${e.toString()}'));
    }
  }
}
