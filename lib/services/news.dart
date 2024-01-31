import 'package:flutter_news_app/model/article_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=66e409bf7e1344b4a733258da34e8949";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ArticleModel articleModel = ArticleModel(
                title: element["title"],
                description: element["description"],
                author: element["author"],
                content: element["content"],
                url: element["url"],
                urlToImage: element["urlToImage"]);
            news.add(articleModel);
          }
        },
      );
    }
  }
}
