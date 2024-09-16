import 'package:news_app/models/source_model.dart';

abstract class SourceStates {}

class SourceInitState extends SourceStates {}

class SourceLoadingState extends SourceStates {}

class SourceErrorState extends SourceStates {
  String errorMessage;
  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceStates {
  List<Sources> sourceList;

  SourceSuccessState({required this.sourceList});
}
