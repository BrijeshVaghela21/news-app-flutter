import 'package:flutter/material.dart';
import 'package:my_news/models/category_model.dart';
import 'package:my_news/helper/data.dart';
import 'package:my_news/models/article_model.dart';
import 'package:my_news/helper/News.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_news/views/news_details.dart';
import 'CategoryNews.dart';
import 'package:my_news/models/Selection.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticlesModel> newsArticle = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    categories = getCategories();

    getNews();
  }

  getNews() async {
    News newsclass = new News();
    await newsclass.getNews();

    newsArticle = newsclass.news;

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
            "MyNews",
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
                    Container(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                            urlName: categories[index].nameInUrl,
                          );
                        },
                      ),
                    ),
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

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName,urlName;

  CategoryTile({super.key, this.imageUrl, this.categoryName,this.urlName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SelectionCat.selectedCat =  urlName;
        SelectionCat.appbarTitle = categoryName;
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryNews(),));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                )),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26,
                ),
                width: 120,
                height: 80,
                child: Text(
                  categoryName,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ))
          ],
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
