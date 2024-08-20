import 'package:flutter/material.dart';
import 'package:news_app/views/home_view.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SourceModel sourceModel = await Api().getSources();
  // print(sourceModel.sources);
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomPage.routName,
      routes: {
        HomPage.routName: (context) => HomPage(),
      },
    );
  }
}
