import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_news/models/Selection.dart';


class NewsDetails extends StatefulWidget {
  var newsUrl;
  NewsDetails({super.key, this.newsUrl});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}


 late  InAppWebViewController _inAppWebViewController;
class _NewsDetailsState extends State<NewsDetails> {
  @override
  void initState() {
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InAppWebView(
        initialUrlRequest:URLRequest(url: Uri.parse(widget.newsUrl)) ,

       
      ),
     
    );
  }
}
