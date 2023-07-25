import 'package:flutter/material.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/helper/News.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_news/views/news_details.dart';
import 'package:my_news/models/Selection.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({super.key});

  @override
  State<CategoryNews> createState() => _CategoryNews();
}

class _CategoryNews extends State<CategoryNews> {

  List<ArticlesModel> newsArticle = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();  
    getNews();
  }

  getNews() async {
    News newsclass = new News();
    await newsclass.getCategoryNews(SelectionCat.selectedCat);

    newsArticle = newsclass.categoryNews;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "${SelectionCat.appbarTitle}",
            style: TextStyle(color: Colors.blueGrey),
          )),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                   
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 700,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: newsArticle.length,
                        itemBuilder: (context, index) {
                          return BlogTile(
                              imgurl: newsArticle[index].urlToImage,
                              title: newsArticle[index].title,
                              desc: newsArticle[index].desc,
                              dateTime: newsArticle[index].publishat,
                              newsUrl: newsArticle[index].url,);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}


class BlogTile extends StatelessWidget {
  String imgurl, title, desc, dateTime,newsUrl;
  BlogTile(
      {super.key,
      required this.imgurl,
      required this.title,
      required this.desc,
      required this.dateTime,
      required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: InkWell(
        onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetails(newsUrl: newsUrl),));
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl: imgurl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(desc, style: TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }
}
