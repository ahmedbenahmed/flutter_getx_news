import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_getx_news/model/news_model.dart';
import 'package:flutter_getx_news/utils/utils.dart';

class ApiProvider extends GetConnect {
  ApiProvider() {
    //   httpClient.baseUrl = BASE_URL;
    httpClient.defaultContentType = 'application/json';
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    try {
      final response = await get(TOP_HEADLINES + API_KEY);
      if (response.status.hasError) {
        return Future.error(response.statusText!);
      } else {
        final result = jsonDecode(response.bodyString!);
        if (result["status"] == "ok") {
          Iterable list = result['articles'];
          var newsArticleList =
              list.map((article) => NewsArticle.fromJson(article)).toList();
          return newsArticleList;
        } else {
          return Future.error("Error Parsing Result");
        }
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
