import 'package:news_app/models/news_model.dart';

abstract class NewsState {}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsState {
  List<Articles> articles;

  NewsSuccessState({required this.articles});
}
