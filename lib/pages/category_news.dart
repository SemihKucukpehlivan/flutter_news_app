import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app/model/show_category.dart';
import 'package:flutter_news_app/pages/article_view.dart';
import 'package:flutter_news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategroryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    ShowCategroryNews showCategoriesNews = ShowCategroryNews();
    await showCategoriesNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoriesNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ShowCategrory(
              image: categories[index].urlToImage!,
              desc: categories[index].description!,
              title: categories[index].title!,
              url: categories[index].url!,
            );
          },
        ),
      ),
    );
  }
}

class ShowCategrory extends StatelessWidget {
  String image, desc, title, url;
  ShowCategrory(
      {required this.image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleView(blogUrl: url),
            ));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              desc,
              maxLines: 3,
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
