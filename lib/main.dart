import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/views/home_view.dart';
import 'package:news_app/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SourceModel sourceModel = await Api().getSources();
  // print(sourceModel.sources);
  // NewsModel newsModel = await Api.getEverythingNews("abc-news");
  // print(newsModel.articles);
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.routName,
      routes: {
        SplashView.routName: (context) => SplashView(),
        HomPage.routName: (context) => HomPage(),
      },
    );
  }
}
