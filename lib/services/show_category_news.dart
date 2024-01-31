import 'dart:convert';
import 'package:flutter_news_app/model/show_category.dart';
import 'package:http/http.dart' as http;

class ShowCategroryNews {
  List<ShowCategroryModel> categories = [];

  Future<void> getCategoriesNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=66e409bf7e1344b4a733258da34e8949";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            ShowCategroryModel categoryModel = ShowCategroryModel(
                title: element["title"],
                description: element["description"],
                author: element["author"],
                content: element["content"],
                url: element["url"],
                urlToImage: element["urlToImage"]);
            categories.add(categoryModel);
          }
        },
      );
    }
  }
}
