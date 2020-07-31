import 'package:flutter/material.dart';
import 'package:news/data/news.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/Home.dart';

class CategoryPage extends StatefulWidget {
  //const CategoryPage({Key key}) : super(key: key);

  final String category;

  CategoryPage({this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Daily"),
          Text(
            "News",
            //textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[500],
            ),
          ),
        ]),
        elevation: 5,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(), //scroll fix
                          itemCount: articles.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogItem(
                              description: articles[index].description,
                              title: articles[index].title,
                              imageUrl: articles[index].urltoImage,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
