import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SourceModel sourceModel = await Api().getSources();
  // print(sourceModel.sources);
  // NewsModel newsModel = await Api.getEverythingNews("abc-news");
  // print(newsModel.articles);
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomPage.routName,
      routes: {
        HomPage.routName: (context) => HomPage(),
      },
    );
  }
}
