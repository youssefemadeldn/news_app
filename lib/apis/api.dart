// https://newsapi.org/v2/top-headlines/sources?apiKey=77b8f7df8a524fdd95bf90b76b3b98d2
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/source_model.dart';

class Api {
  Future<SourceModel> getSources(String categoryId) async {
    Uri url = Uri.https(
      "newsapi.org",
      "/v2/top-headlines/sources",
      {
        "apiKey": "77b8f7df8a524fdd95bf90b76b3b98d2",
        "category": categoryId,
      },
    );
    http.Response response = await http.get(url);

    try {
      Map<String, dynamic> json = jsonDecode(response.body);
      SourceModel sourceModel = SourceModel.fromJson(json);

      return sourceModel;
    } catch (e) {
      throw e;
    }
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

    try {
      Map<String, dynamic> json = jsonDecode(response.body);

      NewsModel newsModel = NewsModel.fromJson(json);

      return newsModel;
    } catch (e) {
      throw e;
    }
  }
}
