// https://newsapi.org/v2/top-headlines/sources?apiKey=77b8f7df8a524fdd95bf90b76b3b98d2
import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';

class Api {
  static Future<SourceModel> getSources() async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {
        "apiKey": "77b8f7df8a524fdd95bf90b76b3b98d2",
      },
    );
    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);
    SourceModel sourceModel = SourceModel.fromJson(json);

    return sourceModel;
  }

// https://newsapi.org/v2/everything?sources=abc-news&apiKey=77b8f7df8a524fdd95bf90b76b3b98d2
  static Future<NewsModel> getEverythingNews(String sourceId) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/everything",
      {
        "apiKey": "77b8f7df8a524fdd95bf90b76b3b98d2",
        "sources": sourceId,
      },
    );

    http.Response response = await http.get(url);

    Map<String, dynamic> json = jsonDecode(response.body);

    NewsModel newsModel = NewsModel.fromJson(json);

    return newsModel;
  }
}
