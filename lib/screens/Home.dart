import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/models/Category.dart';
import 'package:news/models/article_model.dart';
import 'package:news/screens/article_page.dart';
import 'package:news/screens/category.dart';
import '../data/news.dart';

class Home extends StatefulWidget {
//  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: <Widget>[
                      //Categories
                      Container(
                        height: 75,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                categoryName: categories[index].categoryName,
                                imageURl: categories[index].imageUrl,
                              );
                            }),
                      ),
                      //Blogs
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
              ));
  }
}

class CategoryItem extends StatelessWidget {
//  const CategoryItem({Key key}) : super(key: key);

  final imageURl;
  final String categoryName;

  CategoryItem({this.imageURl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryPage(
                category: categoryName.toLowerCase(),
              ),
            ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageURl,
                width: 120,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              alignment: Alignment.center,
              width: 120,
              height: 70,
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BlogItem extends StatelessWidget {
  //const BlogItem({Key key}) : super(key: key);

  final String imageUrl, title, description, url;
  BlogItem(
      {@required this.description,
      @required this.title,
      @required this.imageUrl,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return ArticlePage(blogurl: url);
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
