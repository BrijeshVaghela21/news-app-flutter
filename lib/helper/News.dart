import 'dart:convert';
import 'package:my_news/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticlesModel> news = [];
  List<dynamic> temp = [];

  List<ArticlesModel> categoryNews = [];
  List<dynamic> tempcat = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=general&apiKey=deabef3de8404566971696812afb6328");

    var res = await http.get(url);

    var data = jsonDecode(res.body);

    if (data['status'] == "ok") {
      temp = data['articles'];
      temp.forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticlesModel articlesModel = new ArticlesModel(
              element['author'],
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
              element['publishedAt']);

          news.add(articlesModel);
        }
      });
    }
  }

  Future<void> getCategoryNews(var category) async {
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=deabef3de8404566971696812afb6328");

    var res = await http.get(url);

    var data = jsonDecode(res.body);

    if (data['status'] == "ok") {
      tempcat = data['articles'];
      tempcat.forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticlesModel articlesModel = new ArticlesModel(
              element['author'],
              element['title'],
              element['description'],
              element['url'],
              element['urlToImage'],
              element['content'],
              element['publishedAt']);

          categoryNews.add(articlesModel);
        }
      });
    }
  }
}
