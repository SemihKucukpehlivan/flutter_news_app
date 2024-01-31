import 'package:flutter_news_app/model/slider_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/everything?q=apple&from=2024-01-30&to=2024-01-30&sortBy=popularity&apiKey=66e409bf7e1344b4a733258da34e8949";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach(
        (element) {
          if (element["urlToImage"] != null && element["description"] != null) {
            SliderModel sliderModel = SliderModel(
                title: element["title"],
                description: element["description"],
                author: element["author"],
                content: element["content"],
                url: element["url"],
                urlToImage: element["urlToImage"]);
            sliders.add(sliderModel);
          }
        },
      );
    }
  }
}
